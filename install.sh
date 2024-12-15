#!/usr/bin/env bash

DOTFILES=$(pwd)

# This script creates symbolic links to the .config folder.
# This allows us to easily manage dotfiles using git.

echo -n "Overwrite .bashrc file? [Y/N]: "
read -r input

if [ "$input" = "Y" ] || [ "$input" = "y" ]; then
	rm "$HOME/.bashrc"
	ln -s "$DOTFILES/.bashrc" "$HOME/"
fi

echo "Which suite of dotfiles would you like to install?"
echo "0. All"
echo "1. Gnome"
echo "2. i3"
echo "3. KDE"
echo "4. Sway"
echo -n ": "
read -r input

if [ "$input" = "0" ]; then
	# Full suite.
	
	mkdir "$HOME/.config/geany"
	mkdir "$HOME/.config/gtk-2.0"
	mkdir "$HOME/.config/gtk-3.0"
	mkdir "$HOME/.config/xfce4"

	ln -s "$DOTFILES/.themes/" "$HOME/.themes"
	ln -s "$DOTFILES/.icons/" "$HOME/.icons"

	ln -s "$DOTFILES/alacritty/" "$HOME/.config/alacritty"
	ln -s "$DOTFILES/backgrounds/" "$HOME/.config/backgrounds"
	ln -s "$DOTFILES/conky/" "$HOME/.config/conky"
	ln -s "$DOTFILES/dunst/" "$HOME/.config/dunst"
	ln -s "$DOTFILES/geany/colorschemes/" "$HOME/.config/geany/colorschemes"
	ln -s "$DOTFILES/gtk-2.0/settings.ini" "$HOME/.config/gtk-2.0"
	ln -s "$DOTFILES/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0"
	ln -s "$DOTFILES/i3/" "$HOME/.config/i3"
	ln -s "$DOTFILES/rofi/" "$HOME/.config/rofi"
	ln -s "$DOTFILES/scripts/" "$HOME/.config/scripts"
	ln -s "$DOTFILES/sway/" "$HOME/.config/sway"
	ln -s "$DOTFILES/waybar/" "$HOME/.config/waybar"
	ln -s "$DOTFILES/xfce4/helpers.rc" "$HOME/.config/xfce4/"

elif [ "$input" = "1" ] || [ "$input" = "3" ]; then
	:

elif [ "$input" = "2" ]; then
	# i3 suite.
	
	mkdir "$HOME/.config/geany"
	mkdir "$HOME/.config/gtk-2.0"
	mkdir "$HOME/.config/gtk-3.0"
	mkdir "$HOME/.config/xfce4"

	ln -s "$DOTFILES/.themes/" "$HOME/.themes"
	ln -s "$DOTFILES/.icons/" "$HOME/.icons"

	ln -s "$DOTFILES/alacritty/" "$HOME/.config/alacritty"
	ln -s "$DOTFILES/backgrounds/" "$HOME/.config/backgrounds"
	ln -s "$DOTFILES/conky/" "$HOME/.config/conky"
	ln -s "$DOTFILES/dunst/" "$HOME/.config/dunst"
	ln -s "$DOTFILES/geany/colorschemes/" "$HOME/.config/geany/colorschemes"
	ln -s "$DOTFILES/gtk-2.0/settings.ini" "$HOME/.config/gtk-2.0"
	ln -s "$DOTFILES/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0"
	ln -s "$DOTFILES/i3/" "$HOME/.config/i3"
	ln -s "$DOTFILES/rofi/" "$HOME/.config/rofi"
	ln -s "$DOTFILES/scripts/" "$HOME/.config/scripts"
	ln -s "$DOTFILES/xfce4/helpers.rc" "$HOME/.config/xfce4/"

elif [ "$input" = "4" ]; then
	# Sway suite.
	
	mkdir "$HOME/.config/geany"
	mkdir "$HOME/.config/gtk-2.0"
	mkdir "$HOME/.config/gtk-3.0"
	mkdir "$HOME/.config/xfce4"

	ln -s "$DOTFILES/.themes/" "$HOME/.themes"
	ln -s "$DOTFILES/.icons/" "$HOME/.icons"

	ln -s "$DOTFILES/alacritty/" "$HOME/.config/alacritty"
	ln -s "$DOTFILES/backgrounds/" "$HOME/.config/backgrounds"
	ln -s "$DOTFILES/conky/" "$HOME/.config/conky"
	ln -s "$DOTFILES/dunst/" "$HOME/.config/dunst"
	ln -s "$DOTFILES/geany/colorschemes/" "$HOME/.config/geany/colorschemes"
	ln -s "$DOTFILES/gtk-2.0/settings.ini" "$HOME/.config/gtk-2.0"
	ln -s "$DOTFILES/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0"
	ln -s "$DOTFILES/scripts/" "$HOME/.config/scripts"
	ln -s "$DOTFILES/sway/" "$HOME/.config/sway"
	ln -s "$DOTFILES/waybar/" "$HOME/.config/waybar"
	ln -s "$DOTFILES/xfce4/helpers.rc" "$HOME/.config/xfce4/"
fi

# Always installed.

# Joplin

rm -rf "$HOME/.config/joplin-desktop/userchrome.css"
rm -rf "$HOME/.config/joplin-desktop/userstyle.css"

ln -s "$DOTFILES/joplin/userchrome.css" "$HOME/.config/joplin-desktop"
ln -s "$DOTFILES/joplin/userstyle.css" "$HOME/.config/joplin-desktop"

# MangoHud

rm -rf "$HOME/.config/MangoHud"

ln -s "$DOTFILES/MangoHud/" "$HOME/.config/MangoHud"

# Neofetch

rm -rf "$HOME/.config/neofetch"

ln -s "$DOTFILES/neofetch/" "$HOME/.config/neofetch"

# Startship

rm "$HOME/.config/starship.toml"

ln -s "$DOTFILES/starship.toml" "$HOME/.config/"

# Themes & Icons

mkdir $HOME/.themes
mkdir $HOME/.icons

# This is a copy because of flatpaks trying to create symlinks to these locations.

cp "$DOTFILES/.themes/" "$HOME/.themes"
cp "$DOTFILES/.icons/" "$HOME/.icons"
