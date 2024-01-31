sketchybar --add item weather q \
           --set weather \
                icon.color=0xfff5bde6 \
                icon.font="$FONT:Bold:15.0" \
                update_freq=1800 \
                script="$PLUGIN_DIR/weather.sh" \
           --subscribe weather system_woke

sketchybar --add item weather.moon right \
           --set weather.moon \
                 icon.color="$GREY" \
                 icon.font="$FONT:Bold:14.0" \
                 label.drawing=off \
                 icon.padding_right=7\
    --subscribe weather.moon mouse.clicked