.PHONY: osx nvim

all:
	stow --verbose=1 --target="${HOME}" alacritty \
		common \
		foot \
		htop \
		kak \
		kak-lsp \
		lazygit \
		neofetch \
		rezide \
		starship \
		sway \
		sworkstyle \
		waybar \
		wlogout \
		zsh 
	

linux:
	# make desktop files available to the system
	applications_dir="${HOME}/.local/share/applications"
	mkdir -p "${HOME}/.local/share/applications"
	stow --verbose=2 desktop --target="${HOME}/.local/share/applications"
