#!/usr/bin/env bash
# Link the macOS configs into place. Anything already there is moved to
# <name>.bak first. Safe to re-run.
#
# usage: macos/install.sh [--dry-run]

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=0
[ "${1:-}" = "--dry-run" ] && DRY_RUN=1

link() {
  local src="$HERE/$1" dest="$2"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "  ok      $dest"
    return
  fi
  if [ "$DRY_RUN" = 1 ]; then
    echo "  would link $dest -> $src"
    return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.bak"
    echo "  backup  $dest.bak"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "  linked  $dest"
}

link zsh/.zshrc          "$HOME/.zshrc"
link zsh/.p10k.zsh       "$HOME/.p10k.zsh"
link tmux/tmux.conf      "$HOME/.tmux.conf"
link herdr/config.toml   "$HOME/.config/herdr/config.toml"
link ghostty/config      "$HOME/.config/ghostty/config"
# Karabiner watches its directory, not the file, so the whole folder is linked.
link karabiner           "$HOME/.config/karabiner"

if [ "$DRY_RUN" = 0 ] && command -v herdr >/dev/null; then
  herdr config check && herdr server reload-config >/dev/null 2>&1 || true
fi
if [ ! -x "$HOME/.local/bin/threadr" ]; then
  echo
  echo "threadr is not installed:"
  echo "  git clone https://github.com/shariqnaiyer/threadr ~/Documents/dev/threadr"
  echo "  ~/Documents/dev/threadr/install.sh"
fi
echo
echo "Reload Ghostty (cmd+shift+,) and open a new shell."
