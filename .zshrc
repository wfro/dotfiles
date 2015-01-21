# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dstufft"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/Users/will/.rvm/gems/ruby-2.1.2/bin:/Users/will/.rvm/gems/ruby-2.1.2@global/bin:/Users/will/.rvm/rubies/ruby-2.1.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/will/bin:/Users/will/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# ls after cd
function chpwd() {
    emulate -L zsh
    la -a
}

alias cdp="cd ~/Dropbox/projects"
alias cdd="cd ~/Dropbox/projects/dotfiles"
alias todo="vim ~/Dropbox/projects/TODO.md"
alias cdx="cd ~/Dropbox/projects/exercism"
alias notes="cd ~/Dropbox/projects/notes/outlines"

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

# bundle
alias be="bundle exec"

alias v="vi ."

# rails
alias cons="bundle exec rails c"
alias sbox="bundle exec rails c --sandbox"
alias dbm="bundle exec rake db:migrate"


# git
alias gsh="git s" # git show with my custom options (see gitconfig)
alias gs=" git status"
alias gd=" git d" # git diff with my custom options
alias gco="git checkout"
alias gb=" git branch"
alias ga=" git add"
alias gcm="git commit"
alias gp=" git push"
alias gh=" git hist"
alias gfu="git fetch upstream"
alias brpb=" git rev-parse --abbrev-ref HEAD | xargs echo -n | pbcopy"

# configs
alias emcf= "cd ~/.emacs.d"
alias vicf= "vim ~/Dropbox/projects/dotfiles/.vimrc"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
