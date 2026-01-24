#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Syncing dotfiles..."

# Helper function: copy file only if it's not a symlink to this repo
sync_file() {
    local src="$1"
    local dest="$2"

    if [[ ! -e "$src" ]]; then
        return 0
    fi

    # Skip if source is a symlink pointing into our dotfiles dir
    if [[ -L "$src" ]]; then
        local target
        target=$(readlink "$src")
        if [[ "$target" == "$DOTFILES_DIR"* ]]; then
            return 0
        fi
    fi

    # Copy the file (follow symlinks to get actual content)
    cp -L "$src" "$dest"
    echo "  Synced $(basename "$src")"
}

# ========================================
# 1. Sync existing tracked dotfiles
# ========================================
sync_file "$HOME/.zshrc" "$DOTFILES_DIR/.zshrc"

# Claude config
mkdir -p "$DOTFILES_DIR/claude"
sync_file "$HOME/.claude/CLAUDE.md" "$DOTFILES_DIR/claude/CLAUDE.md"
sync_file "$HOME/.claude/settings.json" "$DOTFILES_DIR/claude/settings.json"
sync_file "$HOME/.claude/statusline-command.sh" "$DOTFILES_DIR/claude/statusline-command.sh"

# ========================================
# 2. Check and add common dotfiles if they exist
# ========================================
COMMON_DOTFILES=(
    ".gitconfig"
    ".vimrc"
    ".tmux.conf"
    ".bashrc"
    ".bash_profile"
    ".npmrc"
    ".editorconfig"
)

for dotfile in "${COMMON_DOTFILES[@]}"; do
    sync_file "$HOME/$dotfile" "$DOTFILES_DIR/$dotfile"
done

# ========================================
# 3. Stage all changes
# ========================================
git -C "$DOTFILES_DIR" add -A

# ========================================
# 4. Check if there are staged changes
# ========================================
if git -C "$DOTFILES_DIR" diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

# ========================================
# 5. Commit with timestamp
# ========================================
git -C "$DOTFILES_DIR" commit -m "Update dotfiles $(date '+%Y-%m-%d %H:%M:%S')"

# ========================================
# 6. Push to main
# ========================================
git -C "$DOTFILES_DIR" push origin main

echo "Dotfiles updated and pushed successfully!"
