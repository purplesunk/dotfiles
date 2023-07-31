#!/usr/bin/env bash

if [ "$#" -eq 0 ];then
    echo "USAGE:"
    echo "get-nerd-fonts font_name"
    echo "get-nerd-fonts -l           Get list of fonts"
    exit 0
fi

# Get the lastest url of the releases/tag
version=$(curl https://github.com/ryanoasis/nerd-fonts/tags  2>&1 | grep -m 1 -E 'releases/tag/v' | sed -E 's/^.*href=\"(.*[0-9])".*$/https:\/\/github.com\1/')


# if -l list the avalible fonts
for args in "$@"
do
    if [ "$args" = "-l" ]; then
        curl -s "$version" | grep -i -E '.*\.tar' | grep -v 'FontPatcher' | sed -E 's/^.*\">(.*)\.tar.*$/\1/'
        exit 0
    fi
done

# Make the fonts directory if not found
fonts_dir="$XDG_DATA_HOME"/fonts
[[ ! -d "$fonts_dir" ]] && mkdir -p "$fonts_dir"

for font in "$@"
do
    # Check if I already have the fonts
    check_installed=$(find "$fonts_dir/." -iname "*$font*NerdFont*")
    if [ -n "$check_installed" ]; then
        echo "$font already installed."
    else
        link=$(curl -s "$version" | grep -i "$font\.tar" | grep -v 'FontPatcher' | sed -E 's/^.*href=\"(.*)".*$/\1/')

        if [ -z "$link" ]; then
            echo "Could not find the font: $font"
        elif wget -c -q --show-progress --progress=bar:force "$link" -O "$font".tar 2>&1; then
            mkdir -p "$fonts_dir"/"$font"
            tar -xvf "$font".tar -C "$fonts_dir"/"$font" && echo "$font installed." && rm "$font".tar
        fi
    fi
done

fc-cache
