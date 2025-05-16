#!/usr/bin/env bash

# Script to adjust Hyprland window gaps (gaps_in and gaps_out)
# Usage: gaps.sh [--inc <value> | --dec <value>]

# Exit on any error
set -e

# Check dependencies
for cmd in hyprctl jq; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        printf "Error: %s is required but not installed.\n" "$cmd" >&2
        exit 1
    fi
done

# Function to get current gap values
get_gaps() {
    local gaps_in gaps_out
    gaps_in=$(hyprctl -j getoption general:gaps_in | jq -r '.int // 0' 2>/dev/null)
    gaps_out=$(hyprctl -j getoption general:gaps_out | jq -r '.int // 0' 2>/dev/null)
    
    # Validate that values are numeric
    if ! [[ "$gaps_in" =~ ^[0-9]+$ && "$gaps_out" =~ ^[0-9]+$ ]]; then
        printf "Error: Failed to retrieve valid gap values.\n" >&2
        exit 1
    fi
    
    printf "%s %s" "$gaps_in" "$gaps_out"
}

# Function to apply gap changes using hyprctl --batch
apply_gaps() {
    local gaps_in=$1 gaps_out=$2
    # Ensure gaps are non-negative
    if [ "$gaps_in" -lt 0 ]; then gaps_in=0; fi
    if [ "$gaps_out" -lt 0 ]; then gaps_out=0; fi
    
    if ! hyprctl --batch "keyword general:gaps_in $gaps_in ; keyword general:gaps_out $gaps_out" >/dev/null; then
        printf "Error: Failed to apply gap changes.\n" >&2
        exit 1
    fi
}

# Parse arguments
action=""
value=5  # Default increment/decrement

while [[ $# -gt 0 ]]; do
    case $1 in
        --inc)
            action="inc"
            [[ -n $2 && $2 =~ ^[0-9]+$ ]] && value=$2
            shift 2 ;;
        --dec)
            action="dec"
            [[ -n $2 && $2 =~ ^[0-9]+$ ]] && value=$2
            shift 2 ;;
        *)
            printf "Usage: %s [--inc <value> | --dec <value>]\n" "$0" >&2
            exit 1 ;;
    esac
done

# Validate action
if [[ -z $action ]]; then
    printf "Error: No action specified. Use --inc or --dec.\n" >&2
    exit 1
fi

# Get current gaps
read -r gaps_in gaps_out < <(get_gaps)

# Calculate new gaps
case $action in
    inc)
        gaps_in=$((gaps_in + value))
        gaps_out=$((gaps_out + value))
        ;;
    dec)
        gaps_in=$((gaps_in - value))
        gaps_out=$((gaps_out - value))
        ;;
esac

# Apply changes
apply_gaps "$gaps_in" "$gaps_out"
