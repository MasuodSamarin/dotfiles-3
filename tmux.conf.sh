####
##
## Boseji's TMUX Config
##
##
## SPDX-License-Identifier: GPL-2.0-only
##
## Copyright (C) 2020 Abhijit Bose <boseji@users.noreply.github.com>
##
####
# start with window 1 (instead of 0)
set -g base-index 1

# start with pane 1
set -g pane-base-index 1

# Vi Config
setw -g mode-keys vi

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

# split panes using | and -
bind '\' split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
#unbind '"'
#unbind %

# open new windows in the current path
bind c new-window -c "#{pane_current_path}"

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Resize Panes
bind-key -n C-S-Up resize-pane -U 10
bind-key -n C-S-Down resize-pane -D 10
bind-key -n C-S-Left resize-pane -L 10
bind-key -n C-S-Right resize-pane -R 10

# shorten command delay
set -sg escape-time 1

# Enable mouse mode (tmux 2.1 and above)
set -g mouse on

# don't rename windows automatically
set-option -g allow-rename off

# Higher History Limit
set -g history-limit 50000

# set default terminal mode to 256 colors
set -g default-terminal "screen-256color"

# Set Refresh Interval for the Status
set -g status-interval 60

# THEME
set -g status-bg colour236
set -g status-fg colour10
#set-option -g status-attr dim
#set-window-option -g window-status-current-fg brightred #orange
#set-window-option -g window-status-current-bg colour236
#set-window-option -g window-status-current-attr bright
setw -g aggressive-resize on
set -g status-justify centre

# IP Address on Left Side
set -g status-left-length 68
set -g status-left "#[fg=colour11]#(ip addr show | grep -v docker | grep -v tun0 | grep -v \"br-\" | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \"Local \" $2}' | cut -d '/' -f 1)#[fg=colour14]#(ip addr show|grep docker|grep 'inet '|grep -v 127.0.0.1| awk '{print \"|Docker \" $2}'|cut -d '/' -f 1)#[fg=colour48]#(ip addr show|grep tun0|grep 'inet '|awk '{print \"|VPN \" $2}'|cut -d '/' -f 1)#(ip addr show|grep ppp0|grep 'inet '|awk '{print \"|VPN-PPP \" $2}'|cut -d '/' -f 1)"
# Show session name, window & pane number, date and time on right side of status bar
set -g status-right-length 68
set -g status-right "#[fg=colour87]\[#S\]#I:#P|#[fg=yellow]%d %b %Y|#[fg=green]%l:%M %p"

# set inactive/active window styles
set -g window-style 'fg=colour247,bg=colour236'
set -g window-active-style 'fg=colour255,bg=black'

