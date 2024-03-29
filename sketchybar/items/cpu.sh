#!/bin/bash

cpu_top=(
  label.font="$FONT:Semibold:7"
  label=CPU
  icon.drawing=off
  width=0
  padding_right=10
  y_offset=6
)

cpu_percent=(
  label.font="$FONT:Heavy:12"
  label=CPU
  y_offset=-4
  padding_right=10
  width=55
  icon.drawing=off
  update_freq=2
  mach_helper="$HELPER"
)

cpu_sys=(
  width=0
  graph.color=$RED
  graph.fill_color=$RED
  padding_right=-10
  label.drawing=off
  icon.drawing=off
  background.height=25
  background.drawing=on
  background.color=$TRANSPARENT
)

cpu_user=(
  graph.color=$BLUE
  padding_right=-10
  label.drawing=off
  icon.drawing=off
  background.height=25
  background.drawing=on
  background.color=$TRANSPARENT
)

# status_bracket=(
#   background.color=$BACKGROUND_1
#   background.border_color=$BACKGROUND_2
#   background.border_width=2
#   background.drawing=on
# )

sketchybar --add item cpu.top right              \
           --set cpu.top "${cpu_top[@]}"         \
                                                 \
           --add item cpu.percent right          \
           --set cpu.percent "${cpu_percent[@]}" \
                                                 \
           --add graph cpu.sys right 75          \
           --set cpu.sys "${cpu_sys[@]}"         \
                                                 \
           --add graph cpu.user right 75         \
           --set cpu.user "${cpu_user[@]}"

# # bracket for everything
# sketchybar --add bracket status                        \
#                 cpu.top cpu.percent cpu.sys cpu.user    \
#                 brew github.bell wifi input volume_icon \
#                 calendar time \
#            --set status "${status_bracket[@]}"