#!/bin/bash

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

apple_logo=(
  icon=$APPLE
  icon.font="$FONT:Black:16.0"
  icon.color="$WHITE"
  icon.padding_left=10
  icon.padding_right=12
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
  background.color=0xfce06666
)

apple_prefs=(
  icon=$PREFERENCES
  label="Preferences"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_activity=(
  icon=$ACTIVITY
  label="Activity"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_lock=(
  icon=$LOCK
  label=" Lock Screen"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

apple_sleep=(
  icon=$SLEEP
  label="Sleep"
  click_script="pmset sleepnow; $POPUP_OFF"
)

apple_restart=(
  icon=$RESTART
  label="Restart"
  click_script="sudo shutdown -r now; $POPUP_OFF"
)

apple_shutdown=(
  icon=$SHUTDOWN
  label="Shutdown"
  click_script="sudo shutdown -h now; $POPUP_OFF"
)

sketchybar --add item apple.logo left                  \
           --set apple.logo "${apple_logo[@]}"         \
                                                       \
           --add item apple.prefs popup.apple.logo     \
           --set apple.prefs "${apple_prefs[@]}"       \
                                                       \
           --add item apple.lock popup.apple.logo      \
           --set apple.lock "${apple_lock[@]}"         \
                                                       \
           --add item apple.sleep popup.apple.logo     \
           --set apple.sleep "${apple_sleep[@]}"       \
                                                       \
           --add item apple.restart popup.apple.logo   \
           --set apple.restart "${apple_restart[@]}"   \
                                                       \
           --add item apple.shutdown popup.apple.logo  \
           --set apple.shutdown "${apple_shutdown[@]}"
