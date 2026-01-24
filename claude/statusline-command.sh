#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Get current directory from Claude Code context
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')

# Get just the directory name (equivalent to %c in zsh)
dir_name=$(basename "$cwd")

# Check if we're in a git repo and get branch
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" branch --show-current 2>/dev/null || echo "detached")

  # Check if dirty (has uncommitted changes)
  if ! git -C "$cwd" diff --quiet 2>/dev/null || ! git -C "$cwd" diff --cached --quiet 2>/dev/null; then
    dirty="✗"
  else
    dirty=""
  fi

  git_info=" git:($branch) $dirty"
else
  git_info=""
fi

# Build the prompt (using printf for ANSI colors)
# Green arrow, cyan directory, blue/red/yellow for git
printf "\033[1;32m➜\033[0m  \033[36m%s\033[0m" "$dir_name"
if [ -n "$git_info" ]; then
  printf " \033[1;34mgit:(\033[31m%s\033[34m)\033[0m" "$branch"
  if [ -n "$dirty" ]; then
    printf " \033[33m%s\033[0m" "$dirty"
  fi
fi
