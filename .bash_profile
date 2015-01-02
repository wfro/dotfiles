# github.com/JoshCheek/dotfiles

alias cdp="ce ~/Dropbox/projects"
alias cdd="ce ~/Dropbox/dots"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
  # -l long format
  # -F / after dirs, * after exe, @ after symlink
  # -G colorize
  # -g suppress owner
  # -o suppress group
  # -h humanize sizes
  # -q print nongraphic chars as question marks
alias l="ls -lFGgohq"
alias la="ls -lFGgohqa" # hidden files

alias be="bundle exec"

# ls after cd
ce() {
  cd "$@" && l;
}

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# git
alias gl=" git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias gsh="git s" # git show with my custom options (see gitconfig)
alias gs=" git status"
alias gd=" git d" # git diff with my custom options
alias gco="git checkout"
alias gb=" git branch"
alias ga=" git add"
alias gcm="git commit -m"
alias gp=" git push"
alias gh=" git hist"
alias brpb=" git rev-parse --abbrev-ref HEAD | xargs echo -n | pbcopy"

# prompt things

# PROMPT
function parse_git_branch {
  branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
  if [ "HEAD" = "$branch" ]; then
    echo "(no branch)"
  else
    echo "$branch"
  fi
}

function prompt_segment {
  if [[ ! -z "$1" ]]; then
    echo "\[\033[${2:-37};45m\]${1}\[\033[0m\]"
  fi
}

function hi_mom {
  # time
  ps1="$(prompt_segment " \@ ")"

  # cwd with coloured current directory
  # path="$(dirname `pwd`)"
  # dir="$(basename `pwd`)"
  # ps1="${ps1} $(prompt_segment " ${path}/")$(prompt_segment "$dir " 34)"

  # cwd
  ps1="${ps1} $(prompt_segment " \w ")"

  # git branch
  git_branch=`parse_git_branch`
  if [[ ! -z "$git_branch" ]]; then ps1="${ps1} $(prompt_segment " $git_branch " 32)"; fi

  # next line
  ps1="${ps1}\n\$ "

  # output
  PS1="$ps1"
}

PROMPT_COMMAND='hi_mom'









# source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
