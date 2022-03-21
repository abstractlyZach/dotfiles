# AbstractlyZach's Dotfiles

This is a collection of configuration files for my programs.

## How to clone this repo locallly
```
git clone https://github.com/AbstractlyZach/dotfiles

# fetch a shallow copy of the submodules
git submodule init
git submodule update --depth=1
```

# Installation
I use [stow](https://www.gnu.org/software/stow/) to 
[manage my dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

## manual installation
If you want to install one of my configs (for example, alacritty), run this command:
```
stow --verbose --target="$HOME" alacritty
```

This will create a symlink from `~/.config/alacritty` to `./alacritty/.config/alacritty/`


## interactive install
You can also perform an interactive install by running [install](install). Make sure you have these dependencies installed:

* [fzf](https://github.com/junegunn/fzf)
* [fd](https://github.com/sharkdp/fd)
* [stow](https://www.gnu.org/software/stow/)

```
./install
```
