#!/bin/sh

pkill waybar
pkill swaync
waybar &
swaync &
