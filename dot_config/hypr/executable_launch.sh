#!/bin/bash

# Clear log
: >"$1"

# Wait for Waybar to start
tail -f "$1" | grep -q "Bar configured"

# Execute programs that need to run after Waybar
nextcloud --background &
ferdium &
