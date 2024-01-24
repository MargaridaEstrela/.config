#!/bin/env/bash

transmission=(
  drawing=off
  background.color=0xfff07178
  background.height=16
  background.corner_radius=16
  label.font="$FONT:Bold:12.0"
  label.color="$WHITE"
  label.padding_right=8
  icon.drawing=off
  update_freq=5
  updates=on
  script="$PLUGIN_DIR/transmission.sh"
)

sketchybar --add item transmission right                \
           --set transmission "${transmission[@]}"