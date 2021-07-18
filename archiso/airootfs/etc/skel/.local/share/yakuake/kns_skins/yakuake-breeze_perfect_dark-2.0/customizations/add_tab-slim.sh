#!/bin/bash
# Convert add_up-slim.svg, add_over-slim.svg and add_down-slim.svg to
# add_up.png, add_over.png and add_down.png.

inkscape -f "../tabs/add_up-slim.svg" -e "../tabs/add_up.png"
inkscape -f "../tabs/add_over-slim.svg" -e "../tabs/add_over.png"
inkscape -f "../tabs/add_down-slim.svg" -e "../tabs/add_down.png"
sed -i '8s/x=[0-9]*/x=19/g' ../tabs.skin
