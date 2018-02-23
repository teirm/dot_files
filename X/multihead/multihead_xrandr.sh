#!/bin/bash

#Properly sets monitors given HDMI1 is available
xrandr --output LVDS1 --auto --rotate normal --pos 0x0 --output HDMI1 --auto --rotate normal --left-of LVDS1 
