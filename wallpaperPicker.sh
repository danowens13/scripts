#!/bin/sh

# Wallpaper Directory
WALL_DIR="/home/dan/Pictures/wallpaper"

# ueberzugpp stuff
UEBERZUG_TMP_DIR="/tmp";

cleanup() {
    ueberzugpp cmd -s "$SOCKET" -a exit
}
trap cleanup HUP INT QUIT TERM EXIT

UB_PID_FILE="$UEBERZUG_TMP_DIR/.$(uuidgen)"
ueberzugpp layer --no-stdin --silent --use-escape-codes --pid-file "$UB_PID_FILE"
UB_PID=$(cat "$UB_PID_FILE")

export SOCKET="$UEBERZUG_TMP_DIR"/ueberzugpp-"$UB_PID".socket


# run fzf with preview
find $WALL_DIR -mindepth 2 -name prim.png | fzf --reverse --preview="ueberzugpp cmd -s $SOCKET -i fzfpreview -a add \
                            -x \$FZF_PREVIEW_LEFT -y \$FZF_PREVIEW_TOP \
                            --max-width \$FZF_PREVIEW_COLUMNS --max-height \$FZF_PREVIEW_LINES \
                            -f {}"

cleanup
