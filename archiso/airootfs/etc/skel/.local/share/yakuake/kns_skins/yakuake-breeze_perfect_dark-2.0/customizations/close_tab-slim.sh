#!/bin/bash
# Convert close_up-slim.svg, close_over-slim.svg and close_down-slim.svg to
# close_up.png, close_over.png and close_down.png.

inkscape -f "../tabs/close_up-slim.svg" -e "../tabs/close_up.png"
inkscape -f "../tabs/close_over-slim.svg" -e "../tabs/close_over.png"
inkscape -f "../tabs/close_down-slim.svg" -e "../tabs/close_down.png"
sed -i '37s/x=[0-9]*/x=20/g' ../tabs.skin
