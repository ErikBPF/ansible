#!/bin/bash

DISPLAY_COUNT=$(xrandr -d :0 -q | grep ' connected' | wc -l)

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
dbus-update-activation-environment --systemd DISPLAY &
setxkbmap us intl &
flameshot &

if [ "$DISPLAY_COUNT" == "3" || "$DISPLAY_COUNT" == "4" ]; then
    xrandr --output eDP1 --off --output DP1 --off --output DP1-1 --primary --mode 2560x1080 --pos 1920x0 --rotate normal --output DP1-2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1-3 --off --output DP2 --off --output DP3 --off --output DP4 --off --output HDMI1 --mode 1920x1080 --pos 4480x0 --rotate normal --output VIRTUAL1 --off
fi