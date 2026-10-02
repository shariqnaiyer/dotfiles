# My Dotfiles

Personal configuration files for my Arch Linux + Hyprland setup, plus a
[`macos/`](macos) folder for the Mac.

## Setup Overview
- **WM**: Hyprland
- **Terminal**: Kitty
- **Shell**: Zsh with Oh My Zsh + Powerlevel10k
- **Bar**: Waybar
- **Launcher**: Rofi
- **Font**: JetBrains Mono Nerd Font

## Installation

1. Clone this repository:
```bash
git clone https://github.com/[your-username]/dotfiles.git ~/dotfiles
```

2. Create symlinks (or copy files):
```bash
# Backup existing configs first!
cp -r ~/.config ~/.config.backup

# Create symlinks
ln -sf ~/dotfiles/.config/hypr ~/.config/
ln -sf ~/dotfiles/.config/waybar ~/.config/
ln -sf ~/dotfiles/.config/kitty ~/.config/
ln -sf ~/dotfiles/.config/rofi ~/.config/
ln -sf ~/dotfiles/.zshrc ~/
ln -sf ~/dotfiles/.p10k.zsh ~/
```

## Key Features
- Clean, minimal aesthetic
- Opaque windows with no borders/shadows
- Catppuccin color scheme
- Fuzzy search in rofi
- Monitor-specific waybar configurations
- JetBrains Mono Nerd Font throughout

## Screenshots
(Add screenshots here)

## Dependencies
- hyprland
- waybar
- kitty
- rofi
- zsh
- oh-my-zsh
- powerlevel10k
- jetbrains-mono-nerd-font

## Notes
- Configured for dual monitor setup (2560x1440 main + 1920x1080 vertical)
- Uses gnome-keyring for credential management
- Includes custom minimal wallpapers

## macOS

`macos/` holds the Mac side: zsh, tmux, [herdr](https://herdr.dev) and Ghostty.

```bash
git clone https://github.com/shariqnaiyer/dotfiles.git ~/Documents/dev/dotfiles
~/Documents/dev/dotfiles/macos/install.sh      # --dry-run first if you like
```

It symlinks each file into place and moves anything it replaces to `<name>.bak`.

| File | Linked to |
|---|---|
| `macos/zsh/.zshrc`, `.p10k.zsh` | `~/.zshrc`, `~/.p10k.zsh` |
| `macos/tmux/tmux.conf` | `~/.tmux.conf` |
| `macos/herdr/config.toml` | `~/.config/herdr/config.toml` |
| `macos/ghostty/config` | `~/.config/ghostty/config` |

herdr and tmux share one set of keys, with prefix `ctrl+s`. In Ghostty,
`cmd+s` sends the same prefix. A herdr tab is a
tmux window, and a herdr workspace is a tmux session.

| Keys | Action |
|---|---|
| `prefix c` / `,` / `&` | new / rename / close tab |
| `prefix n` / `p` / `1`-`9` | next / previous / nth tab |
| `prefix %` / `"` | split vertical / horizontal |
| `prefix h j k l`, `tab` | move between panes |
| `prefix z` / `x` | zoom / close pane |
| `alt+up` / `alt+down` / `alt+1`-`9` | previous / next / nth workspace |
| `prefix C` (tmux), `prefix shift+c` (herdr) | new tab running `claude --dangerously-skip-permissions` |
| `prefix f` | [threadr](https://github.com/shariqnaiyer/threadr): find and resume an agent session |
| `prefix T` (tmux), `prefix shift+t` (herdr) | threadr: fork map |

Ghostty sends the left option key as alt so the `alt` chords work. Right
option still types special characters.
