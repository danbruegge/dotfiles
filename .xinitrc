#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

(sleep 1 && . ~/.screenlayout/2monitors.sh) &
thunar --daemon &

# disable touchpad while typing
# syndaemon -t -k -i 2 &
# connman-notify &

export SDL_VIDEO_FULLSCREEN_HEAD=1 
# exec dbus-launch --exit-with-session gnome-session
exec dbus-launch --exit-with-session startxfce4
# exec dbus-launch --exit-with-session startkde
