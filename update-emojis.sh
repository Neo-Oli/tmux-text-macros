#!/bin/sh
echo "emojis=(" > emojis.sh
curl "https://raw.githubusercontent.com/amio/emoji.json/master/emoji.json" | jq -r ".[] | \"'\(.char): \(.name) [\(.category)]'\"" >> emojis.sh
echo ")" >> emojis.sh
