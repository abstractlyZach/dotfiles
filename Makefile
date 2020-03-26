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

ubuntu:
	make basics
	stow --verbose=2 Xserver
	# load the Xresources file
	xrdb "$(HOME)/.Xresources"
