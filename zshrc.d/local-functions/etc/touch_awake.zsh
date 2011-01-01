#!/bin/zsh -f
#
# timestamp an empty file /tmp/.awake with the time the system was last awakened from sleep
# Requires GNU fileutil version of touch (can be installed with fink)
#
/usr/bin/touch  /tmp/.awake_"$( grep "System Wake" /var/log/system.log | awk '{print $3}' | tail -n 1 )"  

