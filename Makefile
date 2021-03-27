.PHONY: osx nvim

all:
	make linux

osx:
	make basics
	stow --verbose=2 skhd

basics:
	rm nvim/autoload/plug.vim || true
	stow --verbose=2 common
	make nvim

linux:
	make basics
	# load the Xresources file
	xrdb "${HOME}/.config/Xresources"
	# make desktop files available to the system
	applications_dir="${HOME}/.local/share/applications"
	mkdir -p "${HOME}/.local/share/applications"
	stow --verbose=2 desktop --target="${HOME}/.local/share/applications"
