## 📄 README.md

```markdown
# setup_github_environment.sh

A bootstrap script for setting up a consistent GitHub development environment across all your Linux machines.  
This script ensures every device has the same essential tools, Git identity, and SSH configuration so you can seamlessly work on GitHub projects.

---

## 🚀 What the Script Does

- Updates system packages (`apt update && apt upgrade`)
- Installs essential tools:
  - `git`
  - `python3` + `pip`
  - `curl`
  - `code` (Visual Studio Code)
- Configures your global Git identity:
  - Name: **Nathan**
  - Email: **nathanlsmock@protonmail.com**
- Generates a new SSH key (`ed25519`) if one doesn’t exist
  - Prints the public key so you can add it to GitHub under **Settings → SSH and GPG keys**
- Upgrades `pip` to the latest version

---

## 🛠️ Installation

1. Clone this repository:
   ```bash
   git clone git@github.com:leeroy4000/setup_github_environment.sh.git
   cd setup_github_environment.sh
   ```

2. Make the script executable:
   ```bash
   chmod +x setup_github_environment.sh
   ```

3. Move it to `/usr/local/bin` so it’s available system‑wide:
   ```bash
   sudo mv setup_github_environment.sh /usr/local/bin/setup_github_environment.sh
   ```

---

## ▶️ Usage

Run the script anytime you want to bootstrap a new machine:

```bash
setup_github_environment.sh
```

If a new SSH key is generated, copy the printed public key and add it to your GitHub account:

- Go to **GitHub → Settings → SSH and GPG keys → New SSH key**
- Paste the key and give it a label (e.g., "Mint Laptop")

---

## 📂 Workflow

- Run this script **once per machine** to set up the base environment.
- After that, use your project‑specific setup scripts (e.g., `setup_project.sh`) to clone and configure individual repos.

---

## ✅ Notes

- Each machine should have its own SSH key for security. GitHub supports multiple keys per account.
- Once installed in `/usr/local/bin`, you can run `setup_github_environment.sh` from anywhere.
- This script is designed for Debian/Ubuntu/Mint systems. Adjust package manager commands if using another distro.
```
