# dotfiles

All the provided commands assume that the current directory is the root of this 
git project.

## Packages and OS Configuration

### NixOS Configuration

Links (or copies) the NixOS configuration.
```sh
ln ./configs/nixos/configuration.nix /etc/nixos
cp ./configs/nixos/configuration.nix /etc/nixos
```

## Window Manager and Environment

### Hyprland Configuration

Creating a directory for the hyprland config.
```sh
mkdir -p $HOME/.config/hypr
```
Links (or copies) the hyprland configuration.
```sh
ln ./configs/hypr/hyprland.conf $HOME/.config/hypr
cp ./configs/hypr/hyprland.conf $HOME/.config/hypr
```

## Terminal Emulators

### Sakura Configuration

Creating a directory for the config.
```sh
mkdir -p $HOME/.config/sakura
```
Links (or copies) the sakura configuration.
```sh
ln ./configs/sakura/sakura.conf $HOME/.config/sakura
cp ./configs/sakura/sakura.conf $HOME/.config/sakura
```

## Text Editors

### Helix Configuration

Creating a directory for the config.
```sh
mkdir -p $HOME/.config/helix
```
Links (or copies) the helix configuration.
```sh
ln ./configs/helix/config.toml $HOME/.config/helix
cp ./configs/helix/config.toml $HOME/.config/helix
```

## Git

### Local Git Configuration

Links (or copies) the git configuration.
```sh
ln ./configs/git/.gitconfig $HOME
cp ./configs/git/.gitconfig $HOME
```

### Adding SSH key to Github

In order to add a ssh key to add to github, first generate one as follows.
```sh
ssh-keygen -t ed25519 -C "$( git config user.email )"
```
Then copy the generated public key and add it as a github authentication key.

