.PHONY: osx nvim

all:
	make ubuntu

osx:
	make basics
	stow --verbose=2 skhd

basics:
	rm nvim/autoload/plug.vim || true
	stow --verbose=2 common
	make nvim

ubuntu:
	make basics
	# load the Xresources file
	xrdb "${HOME}/.config/Xresources"
