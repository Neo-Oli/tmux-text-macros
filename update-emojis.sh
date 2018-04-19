#!/bin/sh
echo "emojis=(" > emojis.sh
curl "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json" | jq '.[] | "\(.emoji): \(.description)"' | grep -v null >> emojis.sh
echo ")" >> emojis.sh
