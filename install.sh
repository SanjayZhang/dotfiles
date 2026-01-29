#!/bin/bash
# Backup and symlink dotfiles

DOTFILES_DIR="$HOME/dotfiles"

# Backup existing files, then create symlinks
backup_and_link() {
    local src="$1"
    local dest="$2"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        mv "$dest" "$dest.backup"
        echo "Backed up $dest to $dest.backup"
    fi
    ln -sf "$src" "$dest"
    echo "Linked $dest -> $src"
}

# Link .zshrc
backup_and_link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Ensure .claude directory exists
mkdir -p "$HOME/.claude"

# Link claude files
backup_and_link "$DOTFILES_DIR/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
backup_and_link "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
backup_and_link "$DOTFILES_DIR/claude/statusline-command.sh" "$HOME/.claude/statusline-command.sh"
backup_and_link "$DOTFILES_DIR/claude/settings.local.json" "$HOME/.claude/settings.local.json"

echo "Dotfiles installed!"
