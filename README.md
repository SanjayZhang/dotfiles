# Dotfiles

Personal configuration files for zsh and Claude Code.

## Contents

- `.zshrc` - Shell configuration (oh-my-zsh, aliases, environment variables)
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

## Requirements

- [oh-my-zsh](https://ohmyz.sh/) for zsh configuration
- [Claude Code](https://claude.com/claude-code) for Claude settings
