#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# --- requirement checks ---
MISSING=()

check() {
    local cmd=$1 hint=$2
    if ! command -v "$cmd" &>/dev/null; then
        MISSING+=("  ✗ $cmd  →  $hint")
    else
        echo "  ✓ $cmd"
    fi
}

echo "Checking requirements..."
check stow    "brew install stow"
check nvim    "brew install neovim"
check tmux    "brew install tmux"
check ghostty "brew install --cask ghostty"
check fd     "brew install fd"
check fzf          "brew install fzf"
check git          "brew install git"
check node         "brew install node"
check npm          "brew install node"
check tree-sitter  "npm i -g tree-sitter-cli"
check terminal-notifier "brew install terminal-notifier"

if [ ${#MISSING[@]} -gt 0 ]; then
    echo ""
    echo "Missing dependencies — install before continuing:"
    for m in "${MISSING[@]}"; do echo "$m"; done
    echo ""
    read -rp "Continue anyway? [y/N] " yn
    [[ "$yn" =~ ^[Yy]$ ]] || exit 1
fi

echo ""
echo "Stowing configs from $DOTFILES..."
stow -d "$DOTFILES" -t "$HOME" tmux nvim bin ghostty

chmod +x "$HOME/.local/bin/tmux-sessionizer"
chmod +x "$HOME/.local/bin/claude-tmux-notify"

echo "Done. Start a new tmux session to apply changes."
