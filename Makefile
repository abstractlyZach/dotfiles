.PHONY: osx

all:
	make ubuntu

osx:
	make basics
	stow --verbose=2 skhd
	stow --verbose=2 --target="/Users/leez/Library/Application Support/Übersicht/widgets" ubersicht

basics:
	rm nvim/autoload/plug.vim || true
	stow --verbose=2 top_level
	stow --verbose=2 common

ubuntu:
	make basics
	# load the Xresources file
	xrdb "${HOME}/.config/Xresources"
