.PHONY: osx

all:
	make ubuntu

osx:
	make basics
	stow --verbose=2 plangrid
	stow --verbose=2 skhd
	stow --verbose=2 osx

basics:
	stow --verbose=2 common
	rm nvim/autoload/plug.vim

ubuntu:
	make basics
	stow --verbose=2 zsh
	stow --verbose=2 Xserver
