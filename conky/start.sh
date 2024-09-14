#!/bin/bash

# This command will close all active conky processes.

pkill conky

# Only the config(s) listed below will be activated.

conky -c $HOME/.config/conky/wayland/config_amd.conf # &> /dev/null

exit
