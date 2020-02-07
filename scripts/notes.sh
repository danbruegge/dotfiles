#!/bin/sh

TITLE="NOTES"

termite -t "$TITLE" -d ~ -e "nvim Cloud/Notes/quick.md" &
sleep 1 &&
wmctrl -r "$TITLE" -b toggle,maximized_vert,maximized_horz &
