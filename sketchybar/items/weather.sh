sketchybar --add item weather q \
    --set weather \
    icon.color=0xfff5bde6 \
    icon.font="$FONT:Bold:15.0" \
    update_freq=1800 \
    script="$PLUGIN_DIR/weather.sh" \
    --subscribe weather system_woke

sketchybar --add item weather.moon right \
    --set weather.moon \
    icon.color="$BLUE" \
    icon.font="$FONT:Bold:14.0" \
    icon.padding_left=5 \
    icon.padding_right=5 \
    label.drawing=off \
    --subscribe weather.moon mouse.clicked