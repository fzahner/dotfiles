#!/usr/bin/env bash
set -e

# Generate an ed25519 SSH key on first run, if none exists yet.
key="$HOME/.ssh/id_ed25519"

if [ -f "$key" ]; then
  exit 0
fi

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

echo "No SSH key found, generating $key"
# No passphrase, so it runs unattended
ssh-keygen -t ed25519 -a 100 -C "$USER@$(hostname)" -f "$key" -N ""

echo
echo "Public key:"
cat "$key.pub"
