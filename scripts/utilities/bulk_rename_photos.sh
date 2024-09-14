#!/usr/bin/env bash

DIR=$1

image_counter=1
video_counter=1

for file in "$DIR"/*; do
    if [[ -f $file ]]; then
        extension="${file##*.}"
        # Check if the file is a video or an image
        case "$extension" in
            mp4|mkv|avi|mov)
                new_filename=$(printf "VID_%03d.%s" $video_counter $extension)
                video_counter=$((video_counter + 1))
                ;;
            jpg|jpeg|png|gif|bmp)
                new_filename=$(printf "%03d.%s" $image_counter $extension)
                image_counter=$((image_counter + 1))
                ;;
            *)
                echo "Skipping unrecognized file type: $file"
                continue
                ;;
        esac
        mv "$file" "$DIR/$new_filename"
    fi
done
