#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:18.0"
  label.font="$FONT:Bold:12.0"
  icon.padding_left=1
  icon.padding_right=7
  label.padding_left=1
  label.padding_right=10
  label.drawing=on
  update_freq=120
  updates=on
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke mouse.clicked