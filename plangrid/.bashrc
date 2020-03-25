export PATH="/usr/local/bin:$PATH"
# Source our Plangrid shell configs
for file in ${HOME}/.shell.rc.d/*.rc; do
    source ${file}
done
# Add Python and Ruby to path
export PATH=/Library/Ruby/bin:$PATH
python_bin_directories=(${HOME}/Library/Python/*/bin)
extra_python_path=$(printf "%s:" "${python_bin_directories[@]}")
export PATH=${extra_python_path}:$PATH
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.poetry/bin:$PATH"
