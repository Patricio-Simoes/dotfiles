#!/usr/bin/env bash

DOTFILES="$HOME/Documentos/dotfiles"

# This script creates symbolic links to the .config folder.
# This allows us to easily manage dotfiles using git.

rm "$HOME/.bashrc"

mkdir "$HOME/.config/geany"
mkdir "$HOME/.config/gtk-2.0"
mkdir "$HOME/.config/gtk-3.0"
mkdir "$HOME/.config/xfce4"

# List of target and symlink pairs (target -> symlink in ~/.config).

ln -s "$DOTFILES/.themes/" "$HOME/.themes"
ln -s "$DOTFILES/.icons/" "$HOME/.icons"

ln -s "$DOTFILES/.bashrc" "$HOME/"
ln -s "$DOTFILES/alacritty/" "$HOME/.config/alacritty"
ln -s "$DOTFILES/backgrounds/" "$HOME/.config/backgrounds"
ln -s "$DOTFILES/conky/" "$HOME/.config/conky"
ln -s "$DOTFILES/dunst/" "$HOME/.config/dunst"
ln -s "$DOTFILES/geany/colorschemes/" "$HOME/.config/geany/colorschemes"
ln -s "$DOTFILES/gtk-2.0/settings.ini" "$HOME/.config/gtk-2.0"
ln -s "$DOTFILES/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0"
ln -s "$DOTFILES/i3/" "$HOME/.config/i3"
ln -s "$DOTFILES/MangoHud/" "$HOME/.config/MangoHud"
ln -s "$DOTFILES/neofetch/" "$HOME/.config/neofetch"
ln -s "$DOTFILES/rofi/" "$HOME/.config/rofi"
ln -s "$DOTFILES/scripts/" "$HOME/.config/scripts"
ln -s "$DOTFILES/starship.toml" "$HOME/.config/"
ln -s "$DOTFILES/sway/" "$HOME/.config/sway"
ln -s "$DOTFILES/waybar/" "$HOME/.config/waybar"
ln -s "$DOTFILES/xfce4/helpers.rc" "$HOME/.config/xfce4/"
