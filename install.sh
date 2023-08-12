#!/bin/sh
#
# install.sh

srcdir=$(dirname "${BASH_SOURCE[0]}")

# -- NixOS configuration ------------------------------------------------------

# Links (or copies) the NixOS configuration.
ln $srcdir/configuration.nix /etc/nixos/configuration.nix
# cp $srcdir/configuration.nix /etc/nixos/configuration.nix

# -- Hyprland configuration ---------------------------------------------------

# Creating a directory for the hyprland config
mkdir -p $HOME/.config/hypr
# Links (or copies) the hyprland configuration.
ln $srcdir/hyprland.conf $HOME/.config/hypr/hyprland.conf
# cp $srcdir/hyprland.conf $HOME/.config/hypr/hyprland.conf

# -- Terminal Emulator Configuration -------------------------------------------

# Creating a directory for the config
mkdir -p $HOME/.config/sakura
# Links (or copies) the sakura configuration.
ln $srcdir/sakura.conf $HOME/.config/sakura/sakura.conf
# cp $srcdir/sakura.conf $HOME/.config/sakura/sakura.conf

