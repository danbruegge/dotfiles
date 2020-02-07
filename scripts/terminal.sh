#!/bin/sh

termite -d ~ &
sleep 0.5 &&
wmctrl -r "dan@alffred:~" -b add,maximized_vert,maximized_horz &
