#!/usr/bin/env bash
set -eu

# read the selected text from stdin
selection=$(cat)

# Run the translater
result=$(trans -b :pt-br "$selection")

# Saves the result in a temporary file
tmpfile=$(mktemp)
printf '%s\n' "$result" > "$tmpfile"

# Opens a popup with less; closes when you press 'q'
tmux display-popup -E "less '$tmpfile'"
