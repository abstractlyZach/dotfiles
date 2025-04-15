# ~/.bash_profile
#
# https://bbs.archlinux.org/viewtopic.php?id=271207
# GNOME doesn't source .profile on login even though it should.
# We work around this by making new terminals source .profile.

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.profile ]] && . ~/.profile
