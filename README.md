# dotfiles

tmux + nvim setup. Managed with GNU Stow.

## Requirements

```bash
brew install stow fzf neovim tmux
```

## Install

```bash
git clone <repo-url> ~/work/dotfiles
cd ~/work/dotfiles
./setup.sh
```

## What's included

**tmux**
- Prefix: `C-a`
- Splits: `|` vertical, `-` horizontal
- `C-f` → tmux-sessionizer (fzf jump to project in `~/work`)

**nvim**
- Plugin manager: lazy.nvim
- Colorscheme: rose-pine
- Telescope (`<leader>ff/fg/fb/fh`)
- Treesitter

## Adding more

See `Editor Setup.md` in Obsidian for the full plugin checklist.
