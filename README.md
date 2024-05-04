# dotfiles

Other than `configuration.nix` (which belongs in `/etc/nixos/`), all files should have installation location relative to `$HOME`.

Some configuration files (such as `.cwmrc`) make reference to executable scripts which are ommited from this repository.
Such scripts can be found [here](https://github.com/arnavcs/scripts) and can be installed to a location such as `$HOME/.local/bin/` (which is added to the path in the `.profile` configuration).

