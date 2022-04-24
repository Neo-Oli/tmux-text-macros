#!/bin/bash

git clone https://github.com/ryanoasis/nerd-fonts.git || git pull -D nerd-fonts
source nerd-fonts/bin/scripts/lib/i_all.sh

echo "nerd_fonts_icons=(" > nerd-fonts-icons.sh
for i in $(typeset -p | grep 'declare -- i_' | grep -o -P '(?<=declare -- i_).*(?=\=)'); do
    name=i_$i
    echo "'${!name}: $i [Nerd Fonts Icon]'" >> nerd-fonts-icons.sh
done
echo ")" >> nerd-fonts-icons.sh
