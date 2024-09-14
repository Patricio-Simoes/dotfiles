#!/usr/bin/env bash

# This script changes themes in wayland, based on input received.
# Usefull for sessions like Hyprland.

if [ "$1" = "dracula" ]; then
    # Dracula theme.
    THEME="dracula"
    ICONS="dracula"
else
    # Default theme.
    THEME="dracula"
    ICONS="dracula"
fi

#CURSOR=""

SCHEMA="gsettings set org.gnome.desktop.interface"

apply_themes(){
    ${SCHEMA} gtk-theme "$THEME"
    ${SCHEMA} icon-theme "$ICONS"
#    ${SCHEMA} cursor-theme "$CURSOR"
}

apply_themes