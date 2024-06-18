#!/bin/bash

# Directory where suckless programs will be installed
sucklessDir="$HOME/.config/suckless"

# Function to clone a repository if it doesn't exist
clone_repository() {
    local repo_url=$1
    local target_dir=$2

    if [ -d "$target_dir" ]; then
        echo "Error: Directory '$target_dir' already exists."
        return 1
    fi

    git clone "$repo_url" "$target_dir"
}

# Create suckless directory if it doesn't exist
mkdir -p "$sucklessDir" || { echo "Error creating directory '$sucklessDir'"; exit 1; }

# Clone suckless repositories
clone_repository "https://git.suckless.org/dmenu" "$sucklessDir/dmenu" || exit 1
clone_repository "https://git.suckless.org/dwm" "$sucklessDir/dwm" || exit 1
clone_repository "https://git.suckless.org/slstatus" "$sucklessDir/slstatus" || exit 1

# Function to copy config file if it exists
copy_config() {
    local src=$1
    local dest=$2

    if [ -f "$src" ]; then
        cp "$src" "$dest"
    else
        echo "Warning: Config file '$src' not found."
    fi
}

# Copy config files
copy_config "./dwm.config.h" "$sucklessDir/dwm/config.h"
copy_config "./slstatus.config.h" "$sucklessDir/slstatus/config.h"

# Function to install suckless programs
install_suckless_program() {
    local program_dir=$1

    make clean install -C "$program_dir" || { echo "Error installing $program_dir"; exit 1; }
}

# Install suckless programs
install_suckless_program "$sucklessDir/dmenu"
install_suckless_program "$sucklessDir/dwm"
install_suckless_program "$sucklessDir/slstatus"

# Add dwm and slstatus to xinitrc
if [ -f "$HOME/.xinitrc" ]; then
    echo "exec dwm" >> "$HOME/.xinitrc"
    echo "exec slstatus" >> "$HOME/.xinitrc"
elif [ -f "/etc/X11/xinit/xinitrc" ]; then
    echo "slstatus &" >> "/etc/X11/xinit/xinitrc"
    echo "exec dwm" >> "/etc/X11/xinit/xinitrc"
else
    echo "Warning: Neither $HOME/.xinitrc nor /etc/X11/xinit/xinitrc found."
fi

echo "Setup completed successfully."
