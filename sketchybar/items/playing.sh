sketchybar --add item playing left                                                 \
           --set playing update_freq=5                                             \
                       padding_left=60                                             \
                       icon.color="$YELLOW"                                        \
                       label.font="$FONT:Bold:12.0"                                \
                       label.color="$YELLOW"                                       \
                       script="$PLUGIN_DIR/playing.sh"                             \
                       label.y_offset=-1                                           \
                       background.padding_right=3                                  \
                       icon.font="$FONT:Regular:14.8"                              \
           --subscribe playing playing_change mouse.clicked