#!/bin/sh

apk add inotify-tools tree

inotifywait -m "$source" --format '%w%f' -e create |
    while read -r file; do
        mv "$file" "$target"
    done
