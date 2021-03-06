# needs to be manually run since .bash_profile will get picked up before ~/.profile
source ~/.config/common/.profile

# use GNU utilities instead of BSD utilities
export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"


export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Autodesk onboarding puts all their stuff here
source ~/.config/plangrid/.bashrc

# add java stuff to path
export PATH="/usr/local/opt/openjdk/bin:$PATH"

source ~/.config/zsh/.zshrc

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# disable's OSX's "thread safety" precautions that prevent python multiprocessing from working
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
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

# swagger
export PATH="/usr/local/opt/swagger-codegen@2/bin:$PATH"

# OSX doesn't know how to open stuff in browsers, since it wants to promot its own
#   `open` command, so clear this variable
unset BROWSER
