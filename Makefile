.PHONY: osx nvim

all:
	make linux

linux:
	# load the Xresources file
	xrdb "${HOME}/.config/Xresources"
	# make desktop files available to the system
	applications_dir="${HOME}/.local/share/applications"
	mkdir -p "${HOME}/.local/share/applications"
	stow --verbose=2 desktop --target="${HOME}/.local/share/applications"

newstow:
	stow --verbose=1 --target="${HOME}" htop rezide starship \
		alacritty waybar lazygit kak sway zsh common kak-lsp
