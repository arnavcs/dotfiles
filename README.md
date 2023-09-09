# dotfiles

All the provided commands assume that the current directory is the root of this 
git project.

## Packages and OS Configuration

### NixOS Configuration

Links the NixOS configuration.
```sh
ln ./nixos/configuration.nix /etc/nixos
```

### Laptop Specific Configuration

In `configuration.nix`, `asusctl` is set up as I am running this configuration 
on an Asus ROG laptop. Some changes made with `asusctl` include to:
1. reduce the maximum battery capacity to 75% with `asusctl -c 75`
1. disable keyboard flashing during sleep with `asusctl led-pow-2 sleep -k false`
1. change active profile to quiet with `asusctl profile -P Quiet`

## Window Manager and Environment

### Hyprland Configuration

Creating a directory for the hyprland config.
```sh
mkdir -p $HOME/.config/hypr
```
Links the hyprland configuration.
```sh
ln ./hypr/hyprland.conf $HOME/.config/hypr
```

### Waybar Configuration

Creating a directory for the waybar config.
```sh
mkdir -p $HOME/.config/waybar
```
Links the waybar configuration.
```sh
ln ./waybar/config $HOME/.config/waybar
```

### Wallpaper Configuration

The hyprland configuration uses swaybg to automatically set the wallpaper to the
image stored at `$HOME/.config/wallpaper`.

## Terminal Emulators

### Sakura Configuration

Creating a directory for the config.
```sh
mkdir -p $HOME/.config/sakura
```
Links the sakura configuration.
```sh
ln ./sakura/sakura.conf $HOME/.config/sakura
```

## Text Editors

### Helix Configuration

Creating a directory for the config.
```sh
mkdir -p $HOME/.config/helix
```
Links the helix configuration.
```sh
ln ./helix/config.toml $HOME/.config/helix
```

## Git

### Local Git Configuration

Links the git configuration.
```sh
ln ./git/.gitconfig $HOME
```

### Adding SSH key to Github

In order to add a ssh key to add to github, first generate one as follows.
```sh
ssh-keygen -t ed25519 -C "$( git config user.email )"
```
Then copy the generated public key and add it as a github authentication key.

## Typesetting and Word Processing

### GNU TeXmacs

Using my custom CSS file for HTML exports
```
Edit > Preferences > Convert > CSS Stylesheet: https://arnavcs.github.io/assets/texmacs.css
```
