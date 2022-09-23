all: clean install

# install all the dotfiles
install:
	RCRC=./rcrc rcup

# show all the operations that would be done in an installation
dry:
	RCRC=./rcrc lsrc

# remove all the dotfiles
clean:
	RCRC=./rcrc rcdn
