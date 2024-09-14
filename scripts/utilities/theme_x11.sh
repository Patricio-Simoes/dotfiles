#!/usr/bin/env bash

# Check if a theme name was provided
if [ -z "$1" ]; then
    exit 1
fi

theme=$1

# Define the configuration files paths.

BACKGROUNDS=".config/backgrounds"
THEMES=".local/share/themes"

ALACRITTY_CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"
CONKY_FILE="$HOME/.config/conky/config.conf"
GTK3_FILE="$HOME/.config/gtk-3.0/settings.ini"
GTK4_FILE="$HOME/.config/gtk-4.0/settings.ini"
I3_CONFIG_FILE="$HOME/.config/i3/config"
I3_AUTOSTART_FILE="$HOME/.config/i3/configs/autostart.conf"
POWERMENU_FILE="$HOME/.config/rofi/powermenu.rasi"
ROFI_FILE="$HOME/.config/rofi/config.rasi"

# Replace the theme include line based on the provided theme name
case "$theme" in
    eos)
        # i3 appearance.
        sed -i "63s|.*|include ~/$THEMES/i3/eos.conf|" "$I3_CONFIG_FILE"
        # Alacritty appearance.
        sed -i '1s|.*|import = ["'~/$THEMES'/alacritty/eos.toml"]|' "$ALACRITTY_CONFIG_FILE"
        # Wallpaper.
        feh --bg-fill ~/"$BACKGROUNDS"/stars.png
        sed -i '3s|.*|exec --no-startup-id bash -c "sleep 1 \&\& feh --bg-fill ~/'$BACKGROUNDS'/stars.png"|' "$I3_AUTOSTART_FILE"
        # Theme / icons.
        GTK_THEME="Arc-Dark"
        ICON_THEME="qogir"
        sed -i "2s|.*|gtk-theme-name=$GTK_THEME|" "$GTK3_FILE"
        sed -i "3s|.*|gtk-icon-theme-name=$ICON_THEME|" "$GTK3_FILE"
        sed -i "2s|.*|gtk-theme-name=$GTK_THEME|" "$GTK4_FILE"
        sed -i "3s|.*|gtk-icon-theme-name=$ICON_THEME|" "$GTK4_FILE"
        # Rofi appearance.
        sed -i '1s|.*|@theme "'~/.config/rofi/themes/deep-purple.rasi"|' "$ROFI_FILE"
        # Powermenu appearance.
        sed -i "1s|.*|@theme \"~/$THEMES/rofi/deep-purple.rasi\"|" "$POWERMENU_FILE"
        # Conky appearance.
        sed -i "3s|.*|local config_path = home .. '/$THEMES/conky/eos.conf'|" "$CONKY_FILE"
        sed -i '35s|.*|  color1 = foreground,|' "$CONKY_FILE"
        sed -i '36s|.*|  color2 = foreground,|' "$CONKY_FILE"
        sed -i '37s|.*|  color3 = foreground,|' "$CONKY_FILE"
        # Dunst appearance.
        pkill dunst
        cp ~/$THEMES/dunst/dunstrc_eos ~/.config/dunst/dunstrc
        dunst
        ;;
    dracula)
        # i3 appearance.
        sed -i "63s|.*|include ~/$THEMES/i3/dracula.conf|" "$I3_CONFIG_FILE"
        # Alacritty appearance.
        sed -i '1s|.*|import = ["'~/$THEMES'/alacritty/dracula.toml"]|' "$ALACRITTY_CONFIG_FILE"
        # Wallpaper.
        feh --bg-fill ~/"$BACKGROUNDS"/dracula-endeavour.png
        sed -i '3s|.*|exec --no-startup-id bash -c "sleep 1 \&\& feh --bg-fill ~/'$BACKGROUNDS'/dracula-endeavour.png"|' "$I3_AUTOSTART_FILE"
        # Theme / icons.
        GTK_THEME="dracula"
        ICON_THEME="dracula"
        sed -i "2s|.*|gtk-theme-name=$GTK_THEME|" "$GTK3_FILE"
        sed -i "3s|.*|gtk-icon-theme-name=$ICON_THEME|" "$GTK3_FILE"
        sed -i "2s|.*|gtk-theme-name=$GTK_THEME|" "$GTK4_FILE"
        sed -i "3s|.*|gtk-icon-theme-name=$ICON_THEME|" "$GTK4_FILE"
        # Rofi appearance.
        sed -i '1s|.*|@theme "'~/.config/rofi/themes/rofi/dracula.rasi"|' "$ROFI_FILE"
        # Powermenu appearance.
        sed -i "1s|.*|@theme \"~/$THEMES/rofi/dracula.rasi\"|" "$POWERMENU_FILE"
        # Conky appearance.
        sed -i "3s|.*|local config_path = home .. '/$THEMES/conky/dracula.conf'|" "$CONKY_FILE"
        sed -i '35s|.*|  color1 = purple,|' "$CONKY_FILE"
        sed -i '36s|.*|  color2 = purple,|' "$CONKY_FILE"
        sed -i '37s|.*|  color3 = foreground,|' "$CONKY_FILE"
        # Dunst appearance.
        pkill dunst
        cp ~/$THEMES/dunst/dunstrc_dracula ~/.config/dunst/dunstrc
        dunst

        ;;
    *)
        exit 1
        ;;
esac

# Reload i3 configuration to apply changes.

i3-msg reload

# Reload conky configuration to apply changes.

"$HOME"/.config/conky/start.sh
