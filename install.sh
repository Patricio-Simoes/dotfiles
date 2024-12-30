#!/usr/bin/env bash

DOTFILES=$(pwd)

# This script creates symbolic links to the .config folder.
# This allows us to easily manage dotfiles using git.

echo -n "Overwrite .bashrc file? [Y/N]: "
read -r input

if [ "$input" = "Y" ] || [ "$input" = "y" ]; then
	if [ -e "$HOME/.bashrc" ]; then
		rm "$HOME/.bashrc"
	fi
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

	ln -s "$DOTFILES/alacritty/" "$HOME/.config/alacritty"
	ln -s "$DOTFILES/backgrounds/" "$HOME/.config/backgrounds"
	ln -s "$DOTFILES/conky/" "$HOME/.config/conky"
	ln -s "$DOTFILES/dunst/" "$HOME/.config/dunst"
	ln -s "$DOTFILES/geany/colorschemes/" "$HOME/.config/geany/colorschemes"
	ln -s "$DOTFILES/gtk-2.0/settings.ini" "$HOME/.config/gtk-2.0"
	ln -s "$DOTFILES/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0"
	ln -s "$DOTFILES/scripts/" "$HOME/.config/scripts"
	ln -s "$DOTFILES/sway/" "$HOME/.config/sway"
	ln -s "$DOTFILES/swayidle/" "$HOME/.config/swayidle"
	ln -s "$DOTFILES/swaylock/" "$HOME/.config/swaylock"
	ln -s "$DOTFILES/waybar/" "$HOME/.config/waybar"
	ln -s "$DOTFILES/xfce4/helpers.rc" "$HOME/.config/xfce4/"
fi

# Always installed.

# Joplin

if [ -e "$HOME/.config/joplin-desktop/userchrome.css" ]; then
	rm -rf "$HOME/.config/joplin-desktop/userchrome.css"
fi
if [ -e "$HOME/.config/joplin-desktop/userstyle.css" ]; then
	rm -rf "$HOME/.config/joplin-desktop/userstyle.css"
fi

ln -s "$DOTFILES/joplin/userchrome.css" "$HOME/.config/joplin-desktop"
ln -s "$DOTFILES/joplin/userstyle.css" "$HOME/.config/joplin-desktop"

# MangoHud

if [ -e "$HOME/.config/MangoHud" ]; then
	rm -rf "$HOME/.config/MangoHud"
fi

ln -s "$DOTFILES/MangoHud/" "$HOME/.config/MangoHud"

# Neofetch

if [ -e "$HOME/.config/neofetch" ];then
	rm -rf "$HOME/.config/neofetch"
fi

ln -s "$DOTFILES/neofetch/" "$HOME/.config/neofetch"

# Starship

if [ -e "$HOME/.config/starship.toml" ]; then
	rm "$HOME/.config/starship.toml"
fi

ln -s "$DOTFILES/starship.toml" "$HOME/.config/"

# Themes & Icons

if [ -e "$HOME/.themes" ]; then
	rm -rf $HOME/.themes
fi
if [ -e "$HOME/.icons" ]; then
	rm -rf $HOME/.icons
fi«

mkdir $HOME/.themes
mkdir $HOME/.icons

# This is a copy because of flatpaks trying to create symlinks to these locations.

cp -r "$DOTFILES/.themes/" "$HOME/.themes"
cp -r "$DOTFILES/.icons/" "$HOME/.icons"
