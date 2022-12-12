#!/bin/sh
echo "emojisnarrow=(" > emojis-narrow.sh
curl "https://raw.githubusercontent.com/muan/unicode-emoji-json/main/data-by-emoji.json" \
    | jq -r ". | keys[] as \$k | \"'\(\$k)\ufe0e: \(.[\$k] | .name ) (\(.[\$k] | .group)) [Emoji-narrow]'\"" \
    | sed -e 's/:/;/g' -e 's/;/:/1' >> emojis-narrow.sh
echo ")" >> emojis-narrow.sh
