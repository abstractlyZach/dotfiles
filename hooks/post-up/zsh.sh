# remove old symlink if it exists and create a new symlink to zshrc
#
# We do this ourselves because rcm ignores files whose names are prefixed with
# a "." and zsh requires the zshrc file to be named ".zshrc"
rcfile="${XDG_CONFIG_HOME}/zsh/.zshrc"
rm "${rcfile}"
ln -s zshrc "${rcfile}"
