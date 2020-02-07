#!/bin/sh

TITLE="JOURNAL"

termite -t "$TITLE" -d ~ -e "nvim Cloud/Notes/journal.md" &
sleep 1 &&
wmctrl -r "$TITLE" -b toggle,maximized_vert,maximized_horz &
