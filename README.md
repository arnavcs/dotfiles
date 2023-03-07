# scripts

This is a way for me to collect (mainly) bash scripts that I have written,
and have lost once due to switching systems. Keeping them in a repository is 
an attempt to keep them easily accessible and avaliable.

To install scripts locally, simply ensure you have an existing local bin folder
```bash
mkdir -p "$HOME/.local/bin"
```
and link all relevant scripts with the ln command.
```bash
ln -s "./script-name" "$HOME/.local/bin/script-name"
```
If you do not already have this local bin folder in your PATH, you can add it to
the PATH easily in your $HOME/.profile, $HOME/.bash_profile, or $HOME/.bashrc
files with
```bash
if [ -d "$HOME/.local/bin" ]; then
  PATH="$($HOME/.local/bin:$PATH)"
fi
```
