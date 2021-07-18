#!/bin/bash
# Convert close_up-square.svg, close_over-square.svg and close_down-square.svg to
# close_up.png, close_over.png and close_down.png.

inkscape -f "../tabs/close_up-square.svg" -e "../tabs/close_up.png"
inkscape -f "../tabs/close_over-square.svg" -e "../tabs/close_over.png"
inkscape -f "../tabs/close_down-square.svg" -e "../tabs/close_down.png"
sed -i '37s/x=[0-9]*/x=28/g' ../tabs.skin
