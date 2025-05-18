#!/bin/sh
#                     __ _ _
#    _ __  _ __ ___  / _(_) | ___
#   | '_ \| '__/ _ \| |_| | |/ _ \
#  _| |_) | | | (_) |  _| | |  __/
# (_) .__/|_|  \___/|_| |_|_|\___|
#   |_|                           
#

#################
# env variables #
#################

export PATH="$HOME/.local/bin:$PATH"

export MANPAGER="less"
export EDITOR="kak"
export TERMINAL="kitty"
export READER="zathura"

################
# load .bashrc #
################

[ -f ~/.bashrc ] && source ~/.bashrc
