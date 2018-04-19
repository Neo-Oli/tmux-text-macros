#!/data/data/com.termux/files/usr/bin/env bash
get_tmux_option() {
    local option="$1"
    local default_value="$2"
    local option_value=$(tmux show-option -gqv "$option")
    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}
tmux_macros() {
    if [ "$1" = "-r" ];then
        set -f
        local load_defaults=$(get_tmux_option "@load-default-macros" "on")

        #Macro strings. Everything after the last ":" gets removed and is just there as a search string in fzf
        local defaultstrings=(
        "¯\\_(ツ)_/¯:a Shruggie"
        "ಠ_ಠ: Look of Disaprooval"
        "(V) (;,,;) (V): Why not Zoidberg?"
        "ʕ⁰̈●̫⁰̈ʔ: Bear"
        "( ͡° ͜ʖ ͡°):Lenny"
        "(╯°□°）╯︵ ┻━┻:Table flip"
        "(•___• )"
        )
        local BASEDIR=$(dirname $0)
        source $BASEDIR/emojis.sh
        custom=()
        if [ -e "$HOME/.tmux/custom-macros" ];then
            source $HOME/.tmux/custom-macros
        fi
        alldefaults=()
        if [ "$load_defaults" = "on" ];then
            alldefaults=("${strings[@]}" "${emojis[@]}")
        fi
        all=("${alldefaults[@]}" "${custom[@]}")
        for e in "${all[@]}"; do
            echo $e
        done|fzf-tmux|sed -e 's/\\/\\\\/g' -e 's/\(.*\):.*/\1/'|xargs -I_ tmux send-keys '_'
    else
        tmux bind e run-shell "$0 -r"
    fi
}
tmux_macros $@
