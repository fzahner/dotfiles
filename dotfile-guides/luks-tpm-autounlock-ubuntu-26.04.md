# LUKS TPM Auto-Unlock on Ubuntu 26.04 (Lenovo IdeaPad 15, AMD, Microsoft Pluton)

Automatic unlocking of the encrypted root disk at boot using the TPM, sealed to PCR 7 (Secure Boot state), with the normal passphrase kept as a fallback. Uses `systemd-cryptenroll` and Ubuntu's default dracut initramfs. No Clevis needed.

## 1. BIOS settings

| Setting | Value |
|---|---|
| Pluton Firmware TPM | Enabled |
| Enhanced Windows Biometric Security | Disabled |
| Secure Boot | Enabled |
| Secure Boot keys | Restore Factory Keys (so it leaves Setup Mode and enters User Mode) |
| Allow Microsoft 3rd Party UEFI CA | Enabled (otherwise Ubuntu is blocked from booting) |

## 2. Install Ubuntu

Install Ubuntu 26.04 LTS and choose **"Use LVM and encryption"**. Set a strong passphrase. It becomes keyslot 0 and is your permanent fallback.

## 3. Verify the prerequisites

```bash
mokutil --sb-state        # expect: SecureBoot enabled
ls /dev/tpm*              # expect: /dev/tpm0  /dev/tpmrm0
lsblk -f                  # find the LUKS partition (here: /dev/nvme0n1p3, FSTYPE crypto 2)
```

## 4. Install the TPM tools

```bash
sudo apt update
sudo apt install tpm2-tools
sudo tpm2_pcrread sha256:7   # expect a non-zero hex value
```

This also installs the TPM libraries that dracut needs to put into the initramfs.

## 5. Enroll the TPM

```bash
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=7 /dev/nvme0n1p3
```

Enter the disk passphrase when prompted. It reports the new keyslot, for example `New TPM2 token enrolled as key slot 1`.

## 6. Enable the TPM in crypttab

```bash
sudo nano /etc/crypttab
```

Add `tpm2-device=auto` to the options (4th field) of the root volume line:

```
dm_crypt-0 UUID=<your-luks-uuid> none luks,tpm2-device=auto
```

## 7. Rebuild the initramfs

```bash
sudo dracut -f --regenerate-all
```

## 8. Verify before rebooting

```bash
sudo cryptsetup luksDump /dev/nvme0n1p3 | grep -A14 '^Tokens'
sudo lsinitrd /boot/initrd.img-$(uname -r) | grep -E 'token-systemd-tpm2|tpm2-tss'
```

- The luksDump output should show a `systemd-tpm2` token with `tpm2-hash-pcrs: 7` and `tpm2-pcr-bank: sha256`.
- The initramfs should contain `libcryptsetup-token-systemd-tpm2.so` and `tpm2-tss` files.

If the `tpm2-tss` files are missing, add the module and rebuild:

```bash
echo 'add_dracutmodules+=" tpm2-tss "' | sudo tee /etc/dracut.conf.d/20-tpm2-tss.conf
sudo dracut -f --regenerate-all
```

## 9. Reboot

The disk unlocks with no password prompt. If the prompt appears, the passphrase still works. Check the logs with:

```bash
sudo journalctl -b | grep -iE 'tpm|cryptsetup'
```

## Maintenance

PCR 7 changes when the Secure Boot configuration changes. Common causes are BIOS key resets, toggling Secure Boot or the 3rd Party CA setting, and Secure Boot revocation (dbx) updates from firmware or fwupd. When that happens you get the passphrase prompt at boot. Unlock with the passphrase, then re-enroll:

```bash
sudo systemd-cryptenroll --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrs=7 /dev/nvme0n1p3
```

To remove TPM unlocking entirely:

```bash
sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/nvme0n1p3
```

Then remove `tpm2-device=auto` from `/etc/crypttab` and run `sudo dracut -f --regenerate-all`.

## Notes

- **Don't install `clevis-initramfs`.** It swaps out Ubuntu 26.04's default dracut for initramfs-tools. Clevis isn't needed with this setup.
- **Security tradeoff:** binding to PCR 7 only means the laptop boots to the login screen with the disk already unlocked. The TPM protects mainly against the drive being removed and read elsewhere. The login password and screen lock carry the rest.
- **Keep the passphrase somewhere safe.** It's the only way in if the TPM binding breaks.
