" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/Syntastic' " Uber awesome syntax and errors highlighter
Plug 'altercation/vim-colors-solarized' " T-H-E colorscheme
Plug 'tpope/vim-fugitive' " So awesome, it should be illegal
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-pathogen'
Plug 'vim-ruby/vim-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/AutoComplPop'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'ingydotnet/yaml-vim'
Plug 'rhysd/vim-clang-format'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Initialize plugin system
call plug#end()

" - Plugin config begin
" Specify snippet version
let g:snipMate = { 'snippet_version' : 1 }

" Ignore types for shellcheck
let g:syntastic_sh_shellcheck_args="-e SC1090,SC1091,SC2169,SC2187"
" - Plugin config end

" RUBY auto completed
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby compiler ruby

" Diff style by filetype
autocmd FileType php,python,c,java,perl,shell,bash,vim,cpp set ai
autocmd FileType php,python,c,java,perl,shell,bash,vim,cpp set sw=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,cpp set ts=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,cpp set sts=4
autocmd FileType typescript,javascript,html,css,xml,ruby,eruby,haml,yaml set ai
autocmd FileType typescript,javascript,html,css,xml,ruby,eruby,haml,yaml set sw=2
autocmd FileType typescript,javascript,html,css,xml,ruby,eruby,haml,yaml set ts=2
autocmd FileType typescript,javascript,html,css,xml,ruby,eruby,haml,yaml set sts=2
autocmd FileType ruby,eruby,yaml set expandtab

" No backup for crontab
autocmd filetype crontab setlocal nobackup nowritebackup

" Common config
syntax on
set nu
set tabstop=4
set fencs=utf-8,gbk
set t_Co=256
set backspace=indent,eol,start

" Highlight on/off
set hlsearch
map <silent> <Space> :noh<Bar>:echo<CR>

" Vim buffer exchange the clipboard
set clipboard=unnamed

" Set statusline for powerline
set laststatus=2

" Init list space
if has("patch-7.4.710")
	set listchars=tab:>\ ,extends:>,space:~
else
	set listchars=tab:>\ ,extends:>
endif

" Highlight extra white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

command Stw :call <SID>StripTrailingWhitespaces()
