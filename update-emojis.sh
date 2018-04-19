#!/bin/sh
echo "emojis=(" > emojis.sh
curl "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json" | jq -r ".[] | \"'\(.emoji): \(.description)'\"" | grep -v null >> emojis.sh
echo ")" >> emojis.sh
