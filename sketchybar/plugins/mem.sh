#!/usr/bin/env bash

getPrecentage=$(TARGET_PATH="."
top -l 1 | grep -E "^CPU" | grep -Eo '[0-9]+%' | head -1)

getRAM=$(top -l 1 | awk '/PhysMem/ {gsub(/M/,"",$2); gsub(/M/,"",$6); print $2, $6}')

getMB=$(TARGET_PATH="."
top -l1 | awk '/PhysMem/ {print $2}')

precentage=$(echo $getPrecentage)
MB=$(echo $getMB)

sketchybar --set $NAME icon="􀫦" label="$precentage"