#!/bin/bash

update() {
  echo "DEBUG: ICON=$ICON | SSID=$SSID | WIFI_IP=$WIFI_IP | LABEL=$LABEL" > /tmp/sketchybar_wifi_debug.log

  source "$CONFIG_DIR/icons.sh"

  WIFI_IF=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')
  SSID=$(ipconfig getsummary "$WIFI_IF" 2>/dev/null | awk -F ' SSID : ' '/ SSID : / {print $2}')
  WIFI_IP=$(ipconfig getifaddr "$WIFI_IF" 2>/dev/null)

  if [[ -n "$SSID" && -n "$WIFI_IP" ]]; then
    ICON="$WIFI_CONNECTED"
    COLOR="$GREEN"
    LABEL="$SSID ($WIFI_IP)"
  else
    # Fallback: first active interface
    ACTIVE_IF=$(ifconfig -l | tr ' ' '\n' | while read -r iface; do
      IP=$(ipconfig getifaddr "$iface" 2>/dev/null)
      if [ -n "$IP" ]; then
        echo "$iface"
        break
      fi
    done)

    if [ -n "$ACTIVE_IF" ]; then
      IP=$(ipconfig getifaddr "$ACTIVE_IF")
      if [[ "$ACTIVE_IF" == en* ]]; then
        ICON="$WIFI_ETHERNET"
        COLOR="$BLUE"
        LABEL="Ethernet ($IP)"
      else
        ICON="$WIFI_CONNECTED"
        COLOR="$GREEN"
        LABEL="$ACTIVE_IF ($IP)"
      fi
    else
      ICON="$WIFI_DISCONNECTED"
      COLOR="$RED"
      LABEL="No Network"
    fi
  fi


  echo "DEBUG: ICON=$ICON | SSID=$SSID | WIFI_IP=$WIFI_IP | LABEL=$LABEL" > /tmp/sketchybar_wifi_debug.log


  sketchybar --set $NAME icon="$ICON" color=$COLOR label="$LABEL"
  
}


click() {
  CURRENT_WIDTH="$(sketchybar --query "$NAME" | jq -r .label.width)"
  WIDTH=0
  if [ "$CURRENT_WIDTH" -eq 0 ]; then
    WIDTH=dynamic
  fi
  sketchybar --animate sin 20 --set "$NAME" label.width="$WIDTH"
}

case "$SENDER" in
  "wifi_change") update ;;
  "mouse.clicked") click ;;
esac
