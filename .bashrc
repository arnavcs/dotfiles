#!/bin/bash
#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#

export HISTSIZE=
export HISTFILESIZE= # infinite history
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

[[ $- != *i* ]] && return # exit if not running interactively

#########################
# aliases and functions #
#########################

alias ls='ls -hN --group-directories-first --color=auto --hyperlink=auto'
alias clock='tty-clock -ct'
alias termdown='termdown --no-figlet'

function wttr { curl "wttr.in/$1"; }

alias yt-dla='yt-dlp --embed-thumbnail --embed-chapters --extract-audio --audio-quality 0 --audio-format mp3'
alias yt-dlas='yt-dlp --embed-thumbnail --split-chapters --extract-audio --audio-quality 0 --audio-format mp3'

alias mpa='mpv --no-audio-display'

#####################
# kitty integration #
#####################

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
fi

###################
# starship prompt #
###################

eval "$(starship init bash)"

