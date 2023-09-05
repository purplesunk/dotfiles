#!/usr/bin/env bash

function show_usage() {
    echo "USAGE:"
    echo "get-nerd-fonts -[options] [font_names] -o [dir]"
    echo
    echo "OPTIONS:"
    echo "h     Show usage"
    echo "l     Get list of fonts"
    echo "o     Set output directory ($XDG_DATA_HOME/fonts default)"
    exit 0
}

if [ "$#" -eq 0 ]; then
    show_usage
fi

# Get the lastest url of the releases/tag
lastest_url=$(curl https://github.com/ryanoasis/nerd-fonts/tags  2>&1 | grep -m 1 -E 'releases/tag/v' | sed -E 's/^.*href=\"(.*[0-9])".*$/https:\/\/github.com\1/')
link_list=$(curl -s "$lastest_url" 2>&1 | grep -i ".*\.tar" | grep -v 'FontPatcher' | sed -E 's/^.*href=\"(.*)".*$/\1/')

function list_fonts() {
    echo "$link_list" | sed -E 's/^.*\/(.*)\.tar.*$/\1/'
    exit 0
}

function check_output() {
    if [ -d "$1" ]; then
        fonts_dir="$1"
    else
        echo "Invalid directory."
        exit 1
    fi
}

font_list=""
get_output=false
check_installation=true

for arg in "$@"
do
    if $get_output; then
        check_output "$arg"
        get_output=false
        continue
    fi

    case $arg in
        "-h") 
            show_usage;;
        "-l") 
            list_fonts;;
        "-o") 
            get_output=true
            check_installation=false
            continue;;

        *) font_list+="$arg ";;
    esac
done

# If no output is especified use fonts directory
if [ ! -v fonts_dir ]; then
    if [ -v XDG_DATA_HOME ]; then
        fonts_dir="$XDG_DATA_HOME"/fonts
    else 
        fonts_dir="$HOME"/.fonts
    fi
fi

for font in $font_list
do
    # Check if I already have the fonts
    if $check_installation; then
        check_installed=$(find "$fonts_dir/." -iname "*$font*NerdFont*")
    fi

    if [ -n "$check_installed" ]; then
        echo "$font already installed."
    else
        # problem with iosevka and iosevkaterm and ubuntu fonts maybe..
        link=$(echo "$link_list" | grep -i "$font")
        file=$(echo "$link" | sed -E 's/.*\/(.*)/\1/')

        if [ -z "$link" ]; then
            echo "Could not find the font: $font"
        elif wget -c -q --show-progress --progress=bar:force "$link" -O /tmp/"$file" 2>&1; then
            mkdir -p "$fonts_dir"/"$font"
            tar -xf /tmp/"$file" -C "$fonts_dir"/"$font" && echo "$font installed." && rm /tmp/"$file"
        fi
    fi
done

fc-cache
