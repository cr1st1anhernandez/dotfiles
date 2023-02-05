#! /bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar bar_laptop &
if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
    polybar bar_monitor &
    xrandr --output eDP --mode 1920x1080 --pos 0x1080 --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --left-of eDP
fi
