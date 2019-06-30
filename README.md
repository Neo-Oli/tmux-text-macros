tmux-text-macros is a tmux plugin. It let's you define a bunch of strings, from which you can choose by pressing `Prefix + e`.

By default it contains all the emojis and a few emoticons

![Demo](https://raw.githubusercontent.com/Neo-Oli/tmux-text-macros/master/demo.gif)

## Requirements

* [fzf](https://github.com/junegunn/fzf)
* [fzf-tmux](https://github.com/junegunn/fzf#fzf-tmux-script)

## Installation

1. clone repository to `~/.tmux/plugins/`
2. add `run-shell ~/.tmux/plugins/tmux-text-macros/tmux-text-macros.tmux` to your `~/.tmux.conf`
3. run `tmux source ~/.tmux.conf` to enable the changes

## Configuration

You can add your own custom macros to `~/.tmux/custom-macros`. You can use the `custom-macros` file as a template.

If you want to disable all the default macros put `set -g @ttm-load-default-macros off` before loading the plugin in your `.tmux.conf`

### Options

#### @ttm-load-default-macros (default: "on")

Disable all the default macros. Use this if you want to hide all emojis and just use your custom macros

#### @ttm-window-mode (default: "horizontal")

How to split the tmux window
* `horizontal`
* `vertical`
* `full` -> new window

## Usage

Press `Prefix e` (normally `Ctrl+b e`) and choose a string by choosing it with the arrow keys or by entering a search string and press enter.
