# needs to be manually run since .bash_profile will get picked up before ~/.profile
source ~/.profile

# use GNU utilities instead of BSD utilities
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Autodesk onboarding puts all their stuff here
source ~/.bashrc

# add java stuff to path
export PATH="/usr/local/opt/openjdk/bin:$PATH"

source ~/.config/zsh/.zshrc

