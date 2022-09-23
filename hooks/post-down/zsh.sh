set -x
# remove the symlink that we create in the post-up hooks
rcfile="${XDG_CONFIG_HOME}/zsh/.zshrc"
[ -f "${rcfile}" ] && rm "${rcfile}"
