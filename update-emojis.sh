#!/bin/sh
echo "emojis=(" > emojis.sh
curl "https://raw.githubusercontent.com/amio/emoji.json/master/emoji.json" | jq -r ".[] | \"'\(.char): \(.name) [\(.category)]'\""|sed -e 's/:/;/g' -e 's/;/:/1' >> emojis.sh
echo ")" >> emojis.sh
