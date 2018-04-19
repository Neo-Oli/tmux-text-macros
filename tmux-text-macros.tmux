#!/data/data/com.termux/files/usr/bin/env bash
#Macro strings. Everything after the last ":" gets removed and is just there as a search string in fzf
if [ "$1" = "-r" ];then
strings=(
"¯\\_(ツ)_/¯:a Shruggie"
"ಠ_ಠ: Look of Disaprooval"
"(V) (;,,;) (V): Why not Zoidberg?"
"ʕ⁰̈●̫⁰̈ʔ: Bear"
"( ͡° ͜ʖ ͡°):Lenny"
"(╯°□°）╯︵ ┻━┻:Table flip"
"(•___• )"
)

BASEDIR=$(dirname $0)
source $BASEDIR/emojis.sh

all=("${strings[@]}" "${emojis[@]}")
for e in "${all[@]}"; do
    echo $e
done|fzf-tmux|sed -e 's/\\/\\\\/g' -e 's/\(.*\):.*/\1/'|xargs -I_ tmux send-keys '_'
else
    tmux bind e run-shell "$0 -r"
fi
echo $strings
