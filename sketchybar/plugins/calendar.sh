#!/bin/bash
IP=$(curl -s https://ipinfo.io/ip)
LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)

LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
REGION="$(echo $LOCATION_JSON | jq '.region' | tr -d '"')"
COUNTRY="$(echo $LOCATION_JSON | jq '.country' | tr -d '"')"

# Line below replaces spaces with +
LOCATION_ESCAPED="${LOCATION// /+}+${REGION// /+}"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION_ESCAPED?format=j1")

TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_C' | tr -d '"')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{25\}\).*/\1.../')
MOON_PHASE=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_phase' | tr -d '"')

case ${MOON_PHASE} in
"New Moon")
    ICON=􀡈
    ;;
"Waxing Crescent")
    ICON=􀡉
    ;;
"First Quarter")
    ICON=􀡊
    ;;
"Waxing Gibbous")
    ICON=􀡋
    ;;
"Full Moon")
    ICON=􀡌
    ;;
"Waning Gibbous")
    ICON=􀡍
    ;;
"Last Quarter")
    ICON=􀡎
    ;;
"Waning Crescent")
    ICON=􀡏
    ;;
esac

DATE="$(date '+%a %d. %b')"
TIME="$(date '+%H:%M')"

sketchybar --set $NAME icon="$ICON   $(date '+%a %d. %b')" label="$TIME" tooltip="$DATE"

