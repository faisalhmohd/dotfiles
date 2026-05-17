#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Stowing configs from $DOTFILES..."
stow -d "$DOTFILES" -t "$HOME" tmux nvim bin

chmod +x "$HOME/.local/bin/tmux-sessionizer"

echo "Done. Start a new tmux session to apply changes."
