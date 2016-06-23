#!/bin/bash

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` [input.mp4] [output.gif]"
  exit 0
fi

mkdir frames

ffmpeg -i $1 -vf scale=320:-1:flags=lanczos,fps=10 frames/ffout%03d.png
convert -loop 0 frames/ffout*.png $2

rm -r frames
