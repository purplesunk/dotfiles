#!/usr/bin/env bash

if [ "$#" -eq 0 ];then
    echo "USAGE:"
    echo "get-nerd-fonts font_name"
    echo "get-nerd-fonts -l           Get list of fonts"
    exit 1
fi

fonts_dir="$HOME"/.local/share/fonts
[[ ! -d "$fonts_dir" ]] && mkdir -p "$fonts_dir"

# Make something to get the lastest url of the releases/tag curl releases/tag 
version=$(curl https://github.com/ryanoasis/nerd-fonts/tags  2>&1 | grep -m 1 -E 'releases/tag/v' | sed -E 's/^.*releases\/tag\/(v[0-9]*\.[0-9]\.[0-9])\".*$/\1/')

# if -l list the avalible fonts
for args in "$@"
do
    if [ "$args" = "-l" ]; then
        curl -s https://github.com/ryanoasis/nerd-fonts/releases/tag/"$version" | grep -i -E '.*\.zip' | grep -v 'FontPatcher' | sed -E 's/^.*\">(.*)\.zip.*$/\1/'
        exit 0
    fi
done

for font in "$@"
do
    # Check if I already have the fonts
    check_installed=$(find "$fonts_dir/." -iname "*$font*NerdFont*")
    if [ -n "$check_installed" ]; then
        echo "$font already installed."
    else
        link=$(curl -s https://github.com/ryanoasis/nerd-fonts/releases/tag/"$version" | grep -i "$font\.zip" | grep -v 'FontPatcher' | sed -E 's/^.*href=\"(.*)".*$/\1/')

        if [ -z "$link" ]; then
            echo "Could not find the font: $font"
        elif wget -c -q --show-progress --progress=bar:force "$link" -O "$font".zip 2>&1; then
            unzip "$font.zip" -d "$fonts_dir"/"$font" && echo "$font installed." && rm "$font".zip
        fi
    fi
done

fc-cache
