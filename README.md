# My Dotfiles

Personal configuration files for my Arch Linux + Hyprland setup.

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