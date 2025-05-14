#!/usr/bin/env zsh
action=$1
current_rounding=$(hyprctl getoption decoration:rounding -j | jq .int)

if [ "$action" = "increase" ]; then
    new_rounding=$((current_rounding + 2))
elif [ "$action" = "decrease" ]; then
    new_rounding=$((current_rounding - 2))
    # Prevent negative values
    [ $new_rounding -lt 0 ] && new_rounding=0
fi

hyprctl keyword decoration:rounding $new_rounding
