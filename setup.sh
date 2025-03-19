#!/bin/bash

# Create the symlink for default.conf
echo "Creating symlink for default.conf..."
sudo ln -sf /home/afonsoabc36/dotfiles/keyd/default.conf /etc/keyd/default.conf

# Use stow to symlink all the directories
echo "Stowing dotfiles..."

# List of directories to stow
DIRS=("backgrounds" "bashrc" "bat" "nvim" "picom" "polybar" "starship" "tmux" "wezterm")

# Loop over each directory and use stow to symlink
for dir in "${DIRS[@]}"; do
    echo "Stowing $dir..."
    stow -v $dir
done

echo "Setup complete!"
