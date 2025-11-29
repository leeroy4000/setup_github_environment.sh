#!/usr/bin/env bash
set -e  # exit on error

echo "🚀 Bootstrapping GitHub environment..."

# --- Update system ---
sudo apt update && sudo apt upgrade -y

# --- Install essentials ---
sudo apt install -y git python3 python3-pip python3-full curl pipx
pipx ensurepath

# --- Ask for Git identity ---
read -p "Enter your GitHub display name: " GIT_NAME
read -p "Enter your GitHub email address: " GIT_EMAIL

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

# --- Python libraries (system-wide) ---
echo "🐍 Installing common Python libraries system-wide..."
python3 -m pip install --upgrade pip --break-system-packages
python3 -m pip install requests --break-system-packages
python3 -m pip install python-dotenv --break-system-packages

# --- Python tools (via pipx) ---
echo "🛠️ Installing developer tools with pipx..."
pipx install black || true
pipx install flake8 || true
pipx install httpie || true

echo "✅ Base GitHub environment ready with libraries + tools!"
