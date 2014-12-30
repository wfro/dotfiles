execute pathogen#infect()

set rtp+=/usr/local/go/misc/vim

colorscheme solarized
set background=dark

"" ==========  These come from Mislav (http://mislav.uniqpath.com/2011/12/vim-revisited/)  ==========
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

autocmd FileType c,go setlocal shiftwidth=4 tabstop=4

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

"" ========== NERDTree  ==========
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " close vim if NERDTree is the only open buffer


"" ==========  Josh (https://github.com/JoshCheek/dotfiles) ==========
set nobackup                                        " no backup files
set nowritebackup                                   " only in case you don't want a backup file while editing
set noswapfile                                      " no swap files
set scrolloff=4                                     " adds top/bottom buffer between cursor and window
set cursorline                                      " colours the line the cursor is on
set number                                          " line numbers
vnoremap . :norm.<CR>                               " in visual mode, "." will for each line, go into normal mode and execute the "."

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set laststatus=2 " airline fix for not showing without split panes

"" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"" my keybinds
let mapleader="," " remap leader to comma
imap jk <Esc>
imap kj <Esc>
imap jj <Esc>
map <Leader>rbow :RainbowParenthesesToggle<cr> " rainbow parens for lisps
map <Leader>s :w %<cr>
map <Leader>n :NERDTreeToggle<cr>
map <Leader>p orequire "pry"<cr>binding.pry<esc>
map <Leader>cl iconsole.log();<esc>hi " insert console.log(); and place cursor inside parens in insert mode

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

" fugitive git bindings
" https://www.reddit.com/r/vim/comments/21f4gm/best_workflow_when_using_fugitive/cgciltz
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

"" strip trailing whitespace
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

