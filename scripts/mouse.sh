#!/bin/bash

# Changes mouse button 8 to 5 and 9 to 4. This makes the secondary right/left buttons scroll
# instead of going back/forward in history.

my_mouse_id=$(xinput | grep "Logitech USB Trackball" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/')
echo $my_mouse_id > /tmp/my_mouse_id
xinput set-button-map $my_mouse_id 1 4 3 4 5 6 7 5 4
