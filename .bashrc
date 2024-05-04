#!/bin/bash
#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#

HISTSIZE= HISTFILESIZE= # infinite history

export EDITOR="kak"
export MANPAGER="less"

[[ $- != *i* ]] && return # exit if not running interactively

# aliases

alias ls='ls -hN --group-directories-first --color=auto --hyperlink=auto'

# kitty integration

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
fi

