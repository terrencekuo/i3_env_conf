# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set the caplocks to esc
setxkbmap -option caps:escape

# how to remap left alt key to control
# https://askubuntu.com/questions/107626/remapping-the-altgr-key-to-control-with-setxkbmap
# https://askubuntu.com/questions/29731/rebind-alt-key-to-win-using-setxkbmap
#
# ctrl becomes window
# alt becomes control
# window becomes alt
#
# HOWEVER, do to the i3 change
# we then change the real window key (mapped to alt) to be the modifier
setxkbmap -option altwin:ctrl_alt_win

# set the windows key (super key) to control
# https://askubuntu.com/questions/956243/trying-to-remap-my-left-super-key-also-called-windows-key-to-left-or-right-con
# NOTE: this still keeps the control key as control, therefore we just lose the window key
#setxkbmap -option altwin:ctrl_win

# set the ctrl key to alt
setxkbmap -option atl:ctrl

# enable using esc + hjkl for arrow keys
# https://unix.stackexchange.com/questions/414926/bind-capshjkl-to-arrow-keys-caps-to-esc
xmodmap ~/.xmodmap
xcape -e 'Mode_switch=Escape'

# set the resolution
xrandr --output eDP-1 --mode 1920x1080

# automatically detect display port
# https://askubuntu.com/questions/912431/i3-for-dual-monitor-on-laptop
#
# understanding the xrandr command
# https://www.x.org/releases/X11R7.5/doc/man/man1/xrandr.1.html
#
# how to configure i3 workspaces
# https://i3wm.org/docs/userguide.html#multi_monitor
xrandr --output DP-1 --auto --above eDP-1
