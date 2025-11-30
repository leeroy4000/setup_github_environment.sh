#!/usr/bin/env bash
set -e  # exit on error

echo "🚀 Setting up GitHub development environment"

# --- Ensure system is up to date ---
sudo apt update
sudo apt upgrade -y

# --- Install core packages ---
sudo apt install -y git curl python3 python3-pip python3-venv pipx gh

# --- Ensure pipx is on PATH ---
python3 -m pipx ensurepath

# --- Install common Python libraries system-wide ---
echo "🐍 Installing common Python libraries system-wide..."
# ⚠️ Do NOT upgrade pip here — leave it managed by apt
python3 -m pip install --break-system-packages \
    requests \
    beautifulsoup4 \
    pandas \
    numpy \
    lxml \
    rich \
    mkdocs \
    mkdocs-get-deps

# --- Install developer tools globally via pipx ---
echo "🛠️ Installing developer tools globally via pipx..."
pipx install black
pipx install flake8
pipx install pylint
pipx install virtualenv

# --- Configure Git defaults ---
echo "⚙️ Configuring Git defaults..."
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global credential.helper store

# --- SSH key setup ---
if [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
  echo "🔑 Generating new SSH key..."
  ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f "$HOME/.ssh/id_ed25519" -N ""
  echo "✅ SSH key generated. Add the following public key to GitHub:"
  cat "$HOME/.ssh/id_ed25519.pub"
else
  echo "✅ SSH key already exists."
fi

echo "🎉 Environment setup complete!"
