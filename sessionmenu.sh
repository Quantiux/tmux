#!/bin/sh

# See https://jdhao.github.io/2021/11/20/tmux_fuzzy_session_switch/#switching-tmux-sessions-with-menu

tmux list-sessions -F '#S' \
  | awk 'BEGIN {ORS=" "} {print $1, NR, "\"switch-client -t", $1 "\""}' \
  | xargs tmux display-menu -T "Switch-session"
