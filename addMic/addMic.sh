#!/bin/bash
IN_DIR=$1
OUT_DIR=$2

if [[ -z "$IN_DIR" || -z "$OUT_DIR" || ! -d "$IN_DIR" || ! -d "$OUT_DIR" ]]; then
    echo "Error: Both an input and an output directory must be provided and exist."
    echo "Usage: $0 /path/to/in_dir /path/to/out_dir"
    exit 1
fi

find "$IN_DIR" -name '*.mp4' | while read -r fullPath
do
    basePath="${fullPath%.mp4}"
    
    fileName=$(basename "$fullPath")

    if [[ -f "$basePath.m4a" ]]; then
        ffmpeg -nostdin -i "$fullPath" -i "$basePath.m4a" -map 0 -map 1:a -c:v copy -shortest "$OUT_DIR/$fileName"
    else
        echo "Info: $fileName missing matching m4a"
    fi
done
