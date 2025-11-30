
```markdown
# setup_github_environment.sh

A bootstrap script for setting up a reproducible GitHub development environment on Debian/Ubuntu/Mint systems.  
This script prepares your machine with Git, Python, pipx, common libraries, developer tools, and SSH keys for GitHub.

---

## 🚀 What the Script Does

- Updates system packages (`apt update && apt upgrade`).
- Installs core tools: `git`, `curl`, `python3`, `python3-pip`, `python3-venv`, `pipx`, `gh` (GitHub CLI).
- Ensures `pipx` is on your PATH (`pipx ensurepath`).
- Installs common Python libraries system‑wide (without upgrading pip):
  - `requests`, `beautifulsoup4`, `pandas`, `numpy`, `lxml`, `rich`, `mkdocs`, `mkdocs-get-deps`
- Installs developer tools globally via **pipx** (user scope):
  - `black`, `flake8`, `pylint`, `virtualenv`
- Configures Git defaults:
  - Default branch = `main`
  - Pull strategy = merge (not rebase)
  - Credential helper = store
- Generates an SSH key (`ed25519`) if one doesn’t already exist, and prints the public key for adding to GitHub.

---

## 🛠️ Requirements

- Debian/Ubuntu/Mint system with `apt`.
- GitHub CLI (`gh`) will be installed automatically if missing.
- You must authenticate once with GitHub CLI:
  ```bash
  gh auth login
  ```
  - Choose GitHub.com
  - Authenticate with SSH
  - Store credentials

---

## ▶️ Installation

1. Save the script as `setup_github_environment.sh`.
2. Make it executable:
   ```bash
   chmod +x setup_github_environment.sh
   ```
3. Move it into `/usr/local/bin`:
   ```bash
   sudo mv setup_github_environment.sh /usr/local/bin/setup_github_environment.sh
   ```

Now you can run it from anywhere with:
```bash
setup_github_environment.sh
```

---

## 📂 Notes on Pip and Pipx

- **pip is left under apt control**. The script does **not** upgrade pip itself; it only installs libraries system‑wide with `--break-system-packages`. Pip will upgrade cleanly when Mint/Ubuntu updates packages.
- **pipx installs are user‑scoped**. Do not run pipx with `sudo`. Tools are installed into `~/.local/share/pipx/venvs/...` and linked into `~/.local/bin`, which is already in PATH.
- If you rerun `pipx install` for a tool, you may see:
  ```
  'tool' already seems to be installed. Pass '--force' to force installation.
  ```
  Use `--force` to refresh the install if needed.

---

## ✅ Workflow

Run this script once per machine to prepare your environment.  
Afterwards, use the **project setup script** (`setup_github_project.sh`) for individual repos.  

Together, these scripts give you:
- A stable, reproducible environment across machines.
- Private repos by default, with SSH authentication.
- Developer tools (`black`, `flake8`, `pylint`, `virtualenv`) globally available via pipx.
- Common Python libraries installed system‑wide for immediate use.
```

---
