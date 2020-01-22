.PHONY: osx

all:
	make ubuntu

osx:
	make basics
	stow --verbose=2 plangrid
	stow --verbose=2 skhd
	stow --verbose=2 osx
	stow --verbose=2 --target="/Users/leez/Library/Application Support/Übersicht/widgets" ubersicht

basics:
	stow --verbose=2 common
	rm nvim/autoload/plug.vim || true

ubuntu:
	make basics
	stow --verbose=2 zsh
	stow --verbose=2 Xserver
	# load the Xresources file
	xrdb "$(HOME)/.Xresources"
