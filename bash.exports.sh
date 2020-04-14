#!/bin/bash
#                                                          -*- shell-script -*-
#
####
##
## Boseji's Custom Exports
##
## SPDX-License-Identifier: GPL-2.0-only
##
## Copyright (C) 2020 Abhijit Bose <boseji@users.noreply.github.com>
##
####

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# Make Sure we have 256 colors enabled
if [ "$TERM" != "xterm-256color" ]; then
	export TERM=xterm-256color
fi

## Path Config
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export VISUAL=/usr/bin/nano

# Eagle
export QT_XCB_GL_INTEGRATION=xcb_egl

# Local Bin
if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# Rust-lang
if [ -d "$HOME/.cargo/bin" ] ; then
	export PATH="$HOME/.cargo/bin:$PATH"
fi

# Golang Path
if [ -d "$HOME/go/bin" ] ; then
	export PATH="$HOME/go/bin:$PATH"
	export GOPATH=$HOME/go
fi

#Arduino
if [ -d "$HOME/.arduino15/packages" ] ; then
	export ARDUINO_PACKAGES=$HOME/.arduino15/packages
fi
if [ -d "$HOME/Arduino/libraries" ] ; then
	export ARDUINO_WORKSPACE=$HOME/Arduino/libraries
fi

