#!/bin/bash
# Modified from Tom Vincent's Original Script <http://tlvince.com/contact>

usage() { echo "usage: $0 icon colour [dest_dir]"; exit 1; }

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

devices=android,ios,windows-phone
eval mkdir -p "$3/res/{icon,screen}/{$devices}"

# Show the user some progress by outputing all commands being run.
set -x

# Explicitly set background in case image is transparent (see: #3)
convert="convert -background none"
$convert "$1" -resize 128x128 "$3/res/icon/icon.png"

#android
$convert "$1" -resize 36x36 "$3/res/icon/android/icon-36-ldpi.png"
$convert "$1" -resize 48x48 "$3/res/icon/android/icon-48-mdpi.png"
$convert "$1" -resize 72x72 "$3/res/icon/android/icon-72-hdpi.png"
$convert "$1" -resize 96x96 "$3/res/icon/android/icon-96-xhdpi.png"

#ios
$convert "$1" -resize 29x29 "$3/res/icon/ios/icon-29.png"
$convert "$1" -resize 58x58 "$3/res/icon/ios/icon-29-2x.png"
$convert "$1" -resize 87x87 "$3/res/icon/ios/icon-29-3x.png"
$convert "$1" -resize 40x40 "$3/res/icon/ios/icon-40.png"
$convert "$1" -resize 80x80 "$3/res/icon/ios/icon-40-2x.png"
$convert "$1" -resize 50x50 "$3/res/icon/ios/icon-50.png"
$convert "$1" -resize 100x100 "$3/res/icon/ios/icon-50-2x.png"
$convert "$1" -resize 57x57 "$3/res/icon/ios/icon-57.png"
$convert "$1" -resize 114x114 "$3/res/icon/ios/icon-57-2x.png"
$convert "$1" -resize 60x60 "$3/res/icon/ios/icon-60.png"
$convert "$1" -resize 120x120 "$3/res/icon/ios/icon-60-2x.png"
$convert "$1" -resize 180x180 "$3/res/icon/ios/icon-60-3x.png"
$convert "$1" -resize 72x72 "$3/res/icon/ios/icon-72.png"
$convert "$1" -resize 144x144 "$3/res/icon/ios/icon-72-2x.png"
$convert "$1" -resize 76x76 "$3/res/icon/ios/icon-76.png"
$convert "$1" -resize 152x152 "$3/res/icon/ios/icon-76-2x.png"
$convert "$1" -resize 120x120 "$3/res/icon/ios/icon-120.png"

#windows
$convert "$1" -resize 48x48 "$3/res/icon/windows-phone/icon-48.png"
$convert "$1" -resize 173x173 "$3/res/icon/windows-phone/icon-173-tile.png"
$convert "$1" -resize 62x62 "$3/res/icon/windows-phone/icon-62-tile.png"

convert="convert $1 -background $2 -gravity center"

#android
$convert -resize 512x512 -extent 1280x720 "$3/res/screen/android/screen-xhdpi-landscape.png"
$convert -resize 512x512 -extent 720x1280 "$3/res/screen/android/screen-xhdpi-portrait.png"
$convert -resize 256x256 -extent 800x480 "$3/res/screen/android/screen-hdpi-landscape.png"
$convert -resize 256x256 -extent 480x800 "$3/res/screen/android/screen-hdpi-portrait.png"
$convert -resize 256x256 -extent 320x480 "$3/res/screen/android/screen-mdpi-portrait.png"
$convert -resize 256x256 -extent 480x320 "$3/res/screen/android/screen-mdpi-landscape.png"
$convert -resize 128x128 -extent 200x320 "$3/res/screen/android/screen-ldpi-portrait.png"
$convert -resize 128x128 -extent 320x200 "$3/res/screen/android/screen-ldpi-landscape.png"

#windows
$convert -resize 256x256 -extent 480x800 "$3/res/screen/windows-phone/screen-portrait.jpg"

#iphone
$convert -resize 256x256 -extent 320x480 "$3/res/screen/ios/Default.png"
$convert -resize 256x256 -extent 640x960 "$3/res/screen/ios/Default_at_2x.png"
$convert -resize 256x256 -extent 640x1136 "$3/res/screen/ios/Default_iphone5.png"

#ipad
$convert -resize 512x512 -extent 1024x748 "$3/res/screen/ios/Default-ipad-Landscape.png"
$convert -resize 512x512 -extent 768x1004 "$3/res/screen/ios/Default-ipad-Portrait.png"
$convert -resize 1024x1024 -extent 2048x1496 "$3/res/screen/ios/Default-ipad-Landscape_at_2x.png"
$convert -resize 1024x1024 -extent 1536x2028 "$3/res/screen/ios/Default-ipad-Portrait_at_2x.png"
