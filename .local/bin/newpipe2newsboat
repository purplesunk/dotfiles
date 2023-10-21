#!/usr/bin/env bash

sed -E 's/(.*\[\{|\}\]\})/ /g' "$1" | \
sed -E 's/\},\{/\n/g' | \
sed -E 's/^.*"url":"(https.*)","?name":"(.*)".?$/\1  \"Youtube\" # "~\2"/gm' | \
sed -E 's/channel\//feeds\/videos.xml?channel_id=/gm'
