#!/bin/bash

zen_on() {
  sketchybar --set github.bell drawing=off \
             --set apple.logo drawing=off \
             --set '/cpu.*/' drawing=off \
             --set calendar icon.drawing=off \
             --set weather.moon icon.drawing=off \
             --set yabai drawing=off \
             --set space_separator icon.drawing=off \
             --set separator drawing=off \
             --set front_app drawing=off \
             --set volume_icon drawing=off \
             --set spotify.anchor drawing=off \
             --set spotify.play updates=off \
             --set mem drawing=off \
             --set playing drawing=off \
             --set brew drawing=off
}

zen_off() {
  sketchybar --set github.bell drawing=on \
             --set apple.logo drawing=on \
             --set weather.moon icon.drawing=on \
             --set '/cpu.*/' drawing=on \
             --set calendar icon.drawing=on \
             --set mem drawing=on \
             --set space_separator icon.drawing=on \
             --set separator drawing=on \
             --set front_app drawing=on \
             --set yabai drawing=on \
             --set volume_icon drawing=on \
             --set spotify.play updates=on \
             --set playing drawing=on \
             --set brew drawing=on
}

if [ "$1" = "on" ]; then
  zen_on
elif [ "$1" = "off" ]; then
  zen_off
else
  if [ "$(sketchybar --query apple.logo | jq -r ".geometry.drawing")" = "on" ]; then
    zen_on
  else
    zen_off
  fi
fi

