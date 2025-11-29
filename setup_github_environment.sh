#!/usr/bin/env bash
set -e  # exit on error

# === GLOBAL CONFIG ===
GIT_EMAIL="nathanlsmock@protonmail.com"
GIT_NAME="Nathan"

echo "🚀 Bootstrapping GitHub environment..."

# --- Update system ---
sudo apt update && sudo apt upgrade -y

# --- Install essentials ---
sudo apt install -y git python3 python3-pip curl code

# --- Configure Git identity ---
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
echo "✅ Git identity set to $GIT_NAME <$GIT_EMAIL>"

# --- Setup SSH key (if missing) ---
if [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
  echo "🔑 Generating SSH key..."
  ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$HOME/.ssh/id_ed25519" -N ""
  echo "⚠️ Add this SSH key to GitHub (Settings → SSH and GPG keys):"
  cat "$HOME/.ssh/id_ed25519.pub"
else
  echo "🔑 SSH key already exists, skipping."
fi

# --- Upgrade pip ---
python3 -m pip install --upgrade pip

echo "✅ Base GitHub environment ready!"
