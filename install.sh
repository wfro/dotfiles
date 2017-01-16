# Install utils without having to install xcode
# xcode-select --install

bootstrap() {
  # homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew update

  brew install git
  brew install tig
  brew install tmux
  brew install the_silver_searcher
  brew install rbenv # ruby
  brew install opam  # ocaml

  brew install vim --with-override-system-vi

  brew cleanup

  # zsh
  # git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  # chsh -s /bin/zsh

  # nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh
  echo 'Checking nvm installation...'
  command -v nvm

  # elm
  npm install -g elm

  # gvm. to install:
  # gvm listall
  # gvm install go<whatever the latest version was>
  # gvm use go1.4 --default
  # zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

  # vundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

install_dotfiles() {
  git pull origin master

  rsync --exclude ".git/" \
    --exclude "install.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~

  source ~/.zshrc
}

case "$1" in
  bootstrap)
    bootstrap
    ;;
  dotfiles)
    install_dotfiles
    ;;
  *)
    bootstrap
    install_doftiles
    # bootstrap
    # dotfiles
    ;;
esac
