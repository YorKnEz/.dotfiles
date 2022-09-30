#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# count openboard pages
alias obpages='python3 /mnt/Atlas/Documents/Openboard/document/count_pages.py'
# open tlauncher
alias tlauncher='java -jar /home/yorknez/Apps/TLauncher/TLauncher-2.86.jar'
#S1='[\u@\h \W]\$ '

# Allows spawning a new terminal in working dir
source /etc/profile.d/vte.sh
