#!/bin/bash
# Convert add_up-square.svg, add_over-square.svg and add_down-square.svg to
# add_up.png, add_over.png and add_down.png.

inkscape -f "../tabs/add_up-square.svg" -e "../tabs/add_up.png"
inkscape -f "../tabs/add_over-square.svg" -e "../tabs/add_over.png"
inkscape -f "../tabs/add_down-square.svg" -e "../tabs/add_down.png"
sed -i '8s/x=[0-9]*/x=27/g' ../tabs.skin
