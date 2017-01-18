# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#export LC_ALL=C
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

################################################################


export TMOUT=0  # to avoid log out when idle
export TIME="elapsed__%es__maxmemory__%MKB__cpu__%P__nbI__%I__nbO__%O"

# need to force load Xdefaults
#xrdb -load $HOME/.Xdefaults &> /dev/null
# set up colors
#eval `dircolors $HOME/.dir_colors`

# history stuff
# cf. http://stackoverflow.com/questions/338285/prevent-duplicates-from-being-saved-in-bash-history#answer-7449399
# and http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows#3055135
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups  
export HISTSIZE=100000      # big big history
export HISTFILESIZE=100000  # big big history
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
# to get universal history of all terminals in one

export EDITOR="vim"
export PAGER=less
export LESS=-rFX

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Vi mode in terminal
set -o vi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;
# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
for f in /etc/bash_completion /usr/share/bash-completion/bash_completion /usr/share/bash-completion/bash_completion; do
	if [ -f $f ]; then source $f; fi;
done;
fi;
# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
# keybindings
bind '\C-a:menu-complete'
bind '"\M-[A":history-search-backward'
bind '"\M-[B":history-search-forward'
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
