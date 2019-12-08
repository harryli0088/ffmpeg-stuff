#!/bin/bash
for filename in ./${1}/*.rm; do
  extName=$(echo "$filename" | cut -d'/' -f 3) #get file name with extension
  name=${extName:0:${#extName}-3} #get filename without extension
  ../ffmpeg -i "$filename" ./HP1-mp3/${name}.mp3
done
