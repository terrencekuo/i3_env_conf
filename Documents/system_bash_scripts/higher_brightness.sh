#/bin/bash

sudo /bin/bash -c 'brightness_path=/sys/class/backlight/intel_backlight/device/intel_backlight/brightness; mbrightness=$(sudo cat $brightness_path); nbrightness=$( expr $mbrightness + 300 ); echo $nbrightness > $brightness_path'
