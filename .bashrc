# specific aliases
alias ls='ls -G'
alias ll='ls -lah'
alias l='ls -l'
alias vi='vim'

# Git aliases
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

# A little tip for Bash if you are a sysadmin and work with root privileges a lot:
# This will prevent you from accidentally destroying the content of an already 
# existing file if you redirect output (>filename). You can always force overwriting with >|filename.
shopt -o noclobber

function default {
	PS1='\n'"[\$(date +%H:%M)][\u@\h]: \w\n$?>"
}
function setfancy {
	PS1="\n\[\033[0;37m\]\342\224\214\342\224\200\$(if [[ \$? == 0 ]]; then echo \"[\[\033[0;32m\]\[\033[01;32m\]\342\234\223\[\033[0;37m\]]\342\224\200\"; else echo \"[\[\033[0;32m\]\[\033[01;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\"; fi)[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
}

setfancy
# History
# ignore duplicates and same sucessive entries.
HISTCONTROL=ignoreboth

# Expand the history size
HISTFILESIZE=10000 
HISTSIZE=100

# automatic grep color
export GREP_OPTIONS='--color=auto'


# useful functions to have 
function setsold(){ # set solarized dark theme
    echo -ne   '\eP\e]10;#839496\a'  # Foreground   -> base0
    echo -ne   '\eP\e]11;#002B36\a'  # Background   -> base03
    echo -ne   '\eP\e]12;#DC322F\a'  # Cursor       -> red
    echo -ne  '\eP\e]4;0;#073642\a'  # black        -> Base02
    echo -ne  '\eP\e]4;8;#002B36\a'  # bold black   -> Base03
    echo -ne  '\eP\e]4;1;#DC322F\a'  # red          -> red
    echo -ne  '\eP\e]4;9;#CB4B16\a'  # bold red     -> orange
    echo -ne  '\eP\e]4;2;#859900\a'  # green        -> green
    echo -ne '\eP\e]4;10;#586E75\a'  # bold green   -> base01 *
    echo -ne  '\eP\e]4;3;#B58900\a'  # yellow       -> yellow
    echo -ne '\eP\e]4;11;#657B83\a'  # bold yellow  -> base00 *
    echo -ne  '\eP\e]4;4;#268BD2\a'  # blue         -> blue
    echo -ne '\eP\e]4;12;#839496\a'  # bold blue    -> base0 *
    echo -ne  '\eP\e]4;5;#D33682\a'  # magenta      -> magenta
    echo -ne '\eP\e]4;13;#6C71C4\a'  # bold magenta -> violet
    echo -ne  '\eP\e]4;6;#2AA198\a'  # cyan         -> cyan
    echo -ne '\eP\e]4;14;#93A1A1\a'  # bold cyan    -> base1 *
    echo -ne  '\eP\e]4;7;#EEE8D5\a'  # white        -> Base2
    echo -ne '\eP\e]4;15;#FDF6E3\a'  # bold white   -> Base3
}

function setsoll(){ # set solarized light theme
	echo -ne   '\eP\e]10;#657B83\a'  # Foreground   -> base00
	echo -ne   '\eP\e]11;#FDF6E3\a'  # Background   -> base3

	echo -ne   '\eP\e]12;#DC322F\a'  # Cursor       -> red

	echo -ne  '\eP\e]4;0;#073642\a'  # black        -> Base02
	echo -ne  '\eP\e]4;8;#002B36\a'  # bold black   -> Base03
	echo -ne  '\eP\e]4;1;#DC322F\a'  # red          -> red
	echo -ne  '\eP\e]4;9;#CB4B16\a'  # bold red     -> orange
	echo -ne  '\eP\e]4;2;#859900\a'  # green        -> green
	echo -ne '\eP\e]4;10;#586E75\a'  # bold green   -> base01 *
	echo -ne  '\eP\e]4;3;#B58900\a'  # yellow       -> yellow
	echo -ne '\eP\e]4;11;#657B83\a'  # bold yellow  -> base00 *
	echo -ne  '\eP\e]4;4;#268BD2\a'  # blue         -> blue
	echo -ne '\eP\e]4;12;#839496\a'  # bold blue    -> base0 *
	echo -ne  '\eP\e]4;5;#D33682\a'  # magenta      -> magenta
	echo -ne '\eP\e]4;13;#6C71C4\a'  # bold magenta -> violet
	echo -ne  '\eP\e]4;6;#2AA198\a'  # cyan         -> cyan
	echo -ne '\eP\e]4;14;#93A1A1\a'  # bold cyan    -> base1 *
	echo -ne  '\eP\e]4;7;#EEE8D5\a'  # white        -> Base2
	echo -ne '\eP\e]4;15;#FDF6E3\a'  # bold white   -> Base3   

}

extract () { # automatically try extract 
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


 up(){ # go up to n folders 
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
	
function fawk { # directly print given field
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}


s() { # do sudo, or sudo the last command if no argument given
    if [[ $# == 0 ]]; then
    	sudo $(history -p '!!')
    else
    	sudo "$@"
    fi
}

mkcd() { # mkdir and cd into
        if [ $# != 1 ]; then
                echo "Usage: mkcd <dir>"
        else
                mkdir -p $1 && cd $1
        fi
}

# These two keep permanent bookmarks of often used directories:

rd(){ # remember directory
    pwd > "$HOME/.lastdir_$1"
}

crd(){ # go to last bookmarked dir
        lastdir="$(cat "$HOME/.lastdir_$1")">/dev/null 2>&1
        if [ -d "$lastdir" ]; then
                cd "$lastdir"
        else
                echo "no existing directory stored in buffer $1">&2
        fi
}