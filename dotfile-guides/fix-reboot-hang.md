# Fixing Reboot Hangs on Ubuntu 26.04 (Lenovo IdeaPad 15, AMD)

`sudo reboot` shuts the system down, but the machine never restarts: the screen goes dark and the power LED stays on. Linux finishes shutting down cleanly, and then the kernel's default reboot method fails to reach the firmware. The fix is to pick a different method with the `reboot=` kernel parameter. On this machine, `reboot=pci` works.

## 1. Confirm the diagnosis

Power the laptop off by holding the power button, boot again, and read the end of the previous boot's log:

```bash
journalctl -b -1 -e   # expect the last lines: reboot.target ... systemd-shutdown ... Journal stopped
```

- If the log ends with `Reached target reboot.target`, `Sending SIGTERM to remaining processes...` and `Journal stopped`, userspace shut down fine and the hang is in the firmware step. Continue with step 2.
- If it ends earlier, with a service hanging or timing out, you have a different problem. Fix that service instead.

The final `reboot: Restarting system` line never shows up in the journal, because journald has already stopped when the kernel prints it.

## 2. Make GRUB visible for testing

```bash
sudo nano /etc/default/grub
```

| Setting | Value |
|---|---|
| `GRUB_TIMEOUT_STYLE` | `menu` (show the boot menu every time) |
| `GRUB_TIMEOUT` | `5` |
| `GRUB_CMDLINE_LINUX_DEFAULT` | `"reboot=acpi"` (no `quiet splash`, so kernel messages show on screen) |

```bash
sudo update-grub
```

## 3. Try reboot methods one by one

Set one value in `GRUB_CMDLINE_LINUX_DEFAULT`, run `sudo update-grub`, then test with `sudo reboot`. Keep the first one that works.

| Parameter | Method |
|---|---|
| `reboot=acpi` | ACPI reset register |
| `reboot=pci` | PCI reset via port 0xCF9 (**works on this machine**) |
| `reboot=efi` | EFI runtime reset service |
| `reboot=bios` | Legacy BIOS reset |
| `reboot=triple` | Triple fault, last resort |

## 4. Make it permanent

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash reboot=pci"
```

```bash
sudo update-grub
```

Putting `quiet splash` back is optional; it only changes how booting looks. Keeping `GRUB_TIMEOUT_STYLE=menu` is also optional.

## 5. Verify

```bash
cat /proc/cmdline   # expect: ... reboot=pci
sudo reboot         # expect: the machine restarts on its own
```

## Maintenance

A BIOS update can change how the firmware handles resets. After one, test `sudo reboot` again, and if it hangs, go back through step 3.

`/etc/default/grub` is outside `$HOME`, so chezmoi doesn't manage it directly. To reapply the fix on a fresh install, use a run script:

```bash
#!/bin/sh
# run_onchange_after_grub-reboot-fix.sh
if ! grep -q 'reboot=pci' /etc/default/grub; then
  sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 reboot=pci"/' /etc/default/grub
  sudo update-grub
fi
```

## Notes

- **Emergency recovery:** if a GRUB change stops the system from booting, highlight the entry in the GRUB menu, press `e`, edit the `linux ...` line, and press `Ctrl+X` to boot once with that change. Then fix `/etc/default/grub`.
- **If no method works:** check for a BIOS update (see `firmware-updates-fwupd.md`) and try disabling **Fast Boot** in the BIOS settings. If an error appears on screen after the shutdown messages (amdgpu, nvme, …), that driver is the next thing to look at.
- **`reboot` vs. `shutdown`:** use `sudo reboot` or `systemctl reboot`. `reboot now` passes "now" to the kernel as a reboot argument. `shutdown -r now` is the command where `now` is meant to go.
