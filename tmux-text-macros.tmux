#!/usr/bin/env bash
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
        #Macro strings. Everything after the last ":" gets removed and is just there as a search string in fzf
        local BASEDIR=$(dirname $0)

        custom=()
        if [ -e "$HOME/.tmux/custom-macros" ];then
            source $HOME/.tmux/custom-macros
        fi
        alldefaults=()
        if [ "$load_defaults" = "on" ];then
            source $BASEDIR/emojis.sh
            source $BASEDIR/emojis-narrow.sh
            source $BASEDIR/emoticons.sh
            source $BASEDIR/blocks.sh
            source $BASEDIR/boxdrawing.sh
            source $BASEDIR/arrows.sh
            source $BASEDIR/nerd-fonts-icons.sh
            alldefaults=(
                "${emoticons[@]}"
                "${emojis[@]}"
                "${emojisnarrow[@]}"
                "${blocks[@]}"
                "${boxdrawing[@]}"
                "${arrows[@]}"
                "${nerd_fonts_icons[@]}"
            )
        fi
        all=("${alldefaults[@]}" "${custom[@]}")

        tosend="$(for e in "${all[@]}"; do
            echo $e
        done|fzf|sed -e 's/\(.*\):.*/\1/')"
        tmux send-keys -t "$PANE" -l "" "$tosend"
    else
        if [ "$window_mode" = "vertical" ];then
            command="tmux split-window -v"
        elif [ "$window_mode" = "full" ];then
            command="tmux new-window"
        else
            command="tmux split-window -h"
        fi
        tmux bind e run-shell "$command  \"PANE='#{pane_id}' $0 -r\""
    fi
}
window_mode=$(get_tmux_option "@ttm-window-mode" "horizontal")
load_defaults=$(get_tmux_option "@ttm-load-default-macros" "on")
tmux_macros $@
