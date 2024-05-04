# dotfiles

Other than `configuration.nix` (which belongs in `/etc/nixos/`), all files should have installation location relative to `$HOME`.

Some configuration files (such as `.cwmrc`) make reference to executable scripts which are ommited from this repository.
Such scripts can be found [here](https://github.com/arnavcs/scripts) and can be installed to a location such as `$HOME/.local/bin/` (which is added to the path in the `.profile` configuration).

Opting for a computing experience that is intuitive and familiar to me and is easily extensible, my workflow revolves around:

* `cwm` as an X11 window manager, extended with custom scripts
* `dmenu_run` as an application launcher
* `dmenu` or `fzy` as a menu for user input in scripts
* `kitty` as a terminal emulator, with `bash` integration
* `kakoune` as a text editor, making use of external programs like `figlet` and `boxes` via piping
* `firefox`, `qutebrowser`, or `lynx` as a web browser
* `pipe-rename` or `mmv-go` for bulk renaming
* `texmacs` occasionally for typesetting
