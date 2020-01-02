.PHONY: osx

all:
	make ubuntu

osx:
	make basics
	stow --verbose=2 plangrid
	stow --verbose=2 osx

basics:
	stow --verbose=2 common

ubuntu:
	make basics
	sleep 1
