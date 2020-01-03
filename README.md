# dotfiles

Configuration files for all my programs.

## Stow
Some config files need to be in the HOME directory in order to be read. This is problematic since I like having my configuration files in version control, but it would be a bad idea to have your entire HOME directory under source control. 

I use stow to symlink any pesky files from this repo to the HOME directory.
https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

## Installation
```
git clone https://github.com/abstractlyZach/dotfiles.git ~/.config
cd ~/.config
make
```
