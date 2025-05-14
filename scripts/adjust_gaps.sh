#!/usr/bin/env zsh
action=$1
current_gaps_in=$(hyprctl getoption general:gaps_in -j | jq .int)
current_gaps_out=$(hyprctl getoption general:gaps_out -j | jq .int)

if [ "$action" = "increase" ]; then
    new_gaps_in=$((current_gaps_in + 2))
    new_gaps_out=$((current_gaps_out + 5))
elif [ "$action" = "decrease" ]; then
    new_gaps_in=$((current_gaps_in - 2))
    new_gaps_out=$((current_gaps_out - 5))
    # Prevent negative values
    [ $new_gaps_in -lt 0 ] && new_gaps_in=0
    [ $new_gaps_out -lt 0 ] && new_gaps_out=0
fi

hyprctl keyword general:gaps_in $new_gaps_in
hyprctl keyword general:gaps_out $new_gaps_out
