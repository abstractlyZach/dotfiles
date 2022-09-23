# remove old symlink if it exists and create a new symlink to zshrc
#
# We do this ourselves because rcm ignores files whose names are prefixed with
# a "." and zsh requires the zshrc file to be named ".zshrc"

# TODO: learn how rcm sets verbosity and try to match it here
set -x
rcfile="${XDG_CONFIG_HOME}/zsh/.zshrc"
[ -f "${rcfile}" ] && rm "${rcfile}"
ln -s zshrc "${rcfile}"
