#!/bin/sh

areHueLightsOff=$( lampe -s I | rg off )

if [ -n "$areHueLightsOff" ];
then
  echo ""
  notify-send --icon=info "Switch HUE lights ON"
  lampe -s Y
else
  notify-send --icon=info "Switch HUE lights OFF"
  lampe -s N
fi
