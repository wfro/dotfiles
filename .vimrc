set nocompatible                " required by Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'
Plugin 'christoomey/vim-tmux-navigator'     " enables <C-h/j/k/l> split movement between tmux/vim
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'raimondi/delimitmate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-ragtag'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'noahfrederick/vim-hemisu'
" Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on

set background=dark
colorscheme solarized
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set nobackup                    " no backup files
set nowritebackup               " only in case you don't want a backup file while editing
set noswapfile                  " no swap files
set scrolloff=4                 " adds top/bottom buffer between cursor and window
set cursorline                  " colours the line the cursor is on
set relativenumber              " relative line numbers
set laststatus=2                " fix for airline not showing without split panes

" Language specific settings
autocmd FileType clojure :RainbowParenthesesToggle

" close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let mapleader="," " remap leader to comma
imap kj <Esc>
map <Leader>s :w %<cr>
map <Leader>n :NERDTreeToggle<cr>
" ruby/rails
map <Leader>p orequire "pry"; binding.pry<esc>
map <Leader>db :e db/schema.rb<cr>
map <Leader>ro :e config/routes.rb<cr>
map <Leader>em :Emodel<Space>
map <Leader>ec :Econtroller<Space>
map <Leader>es :Espec<Space>
map <Leader>bn :!bundle install<cr>
map <Leader>rr :!rake routes<cr>
" javascript
map <Leader>cl oconsole.log();<esc>hi
map <Leader>cd oconsole.log("debugging");<esc>:w %<cr>
map <Leader>de odebugger;<esc>:w %<cr>
" vimux - send commands to a tmux pane
map <Leader>rj :w %<cr>:call VimuxRunCommand("clear; jasmine-node --verbose " . bufname("%"))<CR>
map <Leader>rs :w %<cr>:call VimuxRunCommand("clear; bundle exec rspec")<CR>
map <Leader>rn :w %<cr>:call VimuxRunCommand("clear; ruby " . bufname("%"))<CR>
" fugitive git bindings
" https://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/cgciltz
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>

" Emacs/Readline keybindings for commandline mode
" http://tiswww.case.edu/php/chet/readline/readline.html#SEC4
" many of these taken from vimacs http://www.vim.org/scripts/script.php?script_id=300
"
" navigation
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
" insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>

" strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

