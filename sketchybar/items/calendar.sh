!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.padding_left=10
  icon.padding_right=2
  label.align=right
  label.padding_left=10
  label.padding_right=10
  padding_left=7
  padding_right=7 
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
  background.color=$BACKGROUND_1
  background.border_color=0x30cad3f5
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
