#!/bin/sh
#
# ~/.xinitrc

sxhkd -c $HOME/.config/berry/sxhkdrc &
exec berry
