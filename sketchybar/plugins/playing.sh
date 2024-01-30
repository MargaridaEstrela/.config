PLAYING=$(cd ~/.config/sketchybar/spotify && ./song.sh)
# ARTIST=$(cd ~/.config/sketchybar/spotify && ./artist.sh)
# BOTH=$(echo $PLAYING && echo " " && echo "| |" && echo " " && echo $ARTIST)
# FINAL=$(echo $BOTH | sed 's/\(.\{22\}\).*/\1.../')
FINAL=$(echo $PLAYING | sed 's/\(.\{20\}\).*/\1.../')

sketchybar --set $NAME icon="􁁒 " label=" $FINAL"

click() {
  CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"

  WIDTH=1
  if [ "$CURRENT_WIDTH" -eq "1" ]; then
    WIDTH=dynamic
  fi

  sketchybar --animate sin 20 --set $NAME label.width="$WIDTH"
}

case "$SENDER" in
  "mouse.clicked") click
  ;;
esac