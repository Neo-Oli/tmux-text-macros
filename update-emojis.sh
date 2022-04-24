#!/bin/sh
echo "emojis=(" > emojis.sh
curl "https://raw.githubusercontent.com/muan/unicode-emoji-json/main/data-by-emoji.json" \
    | jq -r ". | keys[] as \$k | \"'\(\$k): \(.[\$k] | .name ) (\(.[\$k] | .group)) [Emoji]'\"" \
    | sed -e 's/:/;/g' -e 's/;/:/1' >> emojis.sh
echo ")" >> emojis.sh
