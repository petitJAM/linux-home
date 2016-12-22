#!/usr/bin/env bash

TMPFILE=/tmp/scrot_tmp.png
scrot -s $TMPFILE
xclip -selection clipboard -target image/png -i $TMPFILE
rm $TMPFILE
