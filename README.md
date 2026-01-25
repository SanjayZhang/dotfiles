# Dotfiles

Personal configuration files for zsh and Claude Code.

## Contents

- `.zshrc` - Shell configuration (oh-my-zsh, aliases, environment variables)
- `.gitconfig` - Git configuration
- `.bashrc` / `.bash_profile` - Bash configuration
- `claude/` - Claude Code settings
  - `CLAUDE.md` - Global Claude instructions
  - `settings.json` - Permissions and plugin settings
  - `statusline-command.sh` - Custom status line script

## Installation

```bash
git clone https://github.com/zhangshengjie/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The install script will:
1. Backup existing files (adds `.backup` suffix)
2. Create symlinks to the dotfiles repo

## Updating

To sync changes from your home directory and push to the repo:

```bash
./update.sh
```

The update script will:
1. Sync dotfiles that aren't already symlinked to the repo
2. Auto-detect common dotfiles (`.gitconfig`, `.vimrc`, `.tmux.conf`, etc.)
3. Commit changes with a timestamp (only if there are changes)
4. Push to main

## Requirements

- [oh-my-zsh](https://ohmyz.sh/) for zsh configuration
- [Claude Code](https://claude.com/claude-code) for Claude settings
