tmux-text-macros is a tmux plugin. It let's you define a bunch of strings, from which you can choose by pressing `Prefix + e`.

## Requirements

* [fzf](https://github.com/junegunn/fzf)

## Installation

1. clone repository to `~/.tmux/plugins/`
2. add `run-shell ~/.tmux/plugins/tmux-text-macros/tmux-text-macros.tmux` to your `~/.tmux.conf`
3. run `tmux source ~/.tmux.conf` to enable the changes

## Usage

Press `Prefix e` (normally `Ctrl+b e`) and choose a string by choosing it with the arrow keys or by entering a search string and press enter.
