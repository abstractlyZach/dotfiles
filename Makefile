.PHONY: osx

all:
	make ubuntu

osx:
	make basics
	stow --verbose=2 skhd
	stow --verbose=2 --target="/Users/leez/Library/Application Support/Übersicht/widgets" ubersicht

basics:
	rm nvim/autoload/plug.vim || true
	stow --verbose=2 common

ubuntu:
	make basics
	# load the Xresources file
	xrdb "${HOME}/.config/Xresources"

# this one must be run manually since it requires sudo
dwm:
	 sudo stow --verbose=2 --target="/usr/share/xsessions/" xsessions
