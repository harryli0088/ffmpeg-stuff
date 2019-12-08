#!/bin/bash
for filename in ./${1}/*.mp4; do #get the folder from the first argument and loop through all mp4 files
  RESOLUTION=$(./ffprobe -v error -show_entries stream=width,height -of csv=p=0:s=x ${filename}) #get the resolution of the video
  SUBSTRING=${RESOLUTION:5:4} #get the height of the video
  if [[ "$SUBSTRING" != "1080" ]]; then #if this video is not of width 1080, convert it
    echo $RESOLUTION $filename
    echo "Resizing..."
    newName=${filename:0:${#filename}-3}1080p.mp4 #make new filename
    echo $newName
    ./ffmpeg -i $filename -vf scale=2336x1080 $newName #convert
  fi
done
