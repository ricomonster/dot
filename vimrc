set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'
source ~/.vim/plugin/nerdtree

" NERDTree Tabs
Plugin 'jistr/vim-nerdtree-tabs'

" NERDTree Dir Enter
Plugin 'Nopik/vim-nerdtree-direnter'

" NERDTree Git Plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
source ~/.vim/plugin/ctrlp

" Vim-GitGutter
Plugin 'airblade/vim-gitgutter'

" START: Colorschemes
" Spacegray
" Plugin 'ajh17/Spacegray.vim'

" Vim One
Plugin 'rakr/vim-one'

" Paramount
" Plugin 'owickstrom/vim-colors-paramount'

" Eink.vim
" Plugin 'clinstid/eink.vim'

" Badwolf
" Plugin 'sjl/badwolf'

" Skull Vim
"Plugin 'beigebrucewayne/skull-vim'

" Vim Moonscape
" Plugin 'Drogglbecher/vim-moonscape'

" True Monochrome
" Plugin 'ryanpcmcquen/true-monochrome_vim'

" Blame
" Plugin 'hauleth/blame.vim'

" Dracula
" Plugin 'dracula/vim'

" END: Colorschemes

" Vim Airline
Plugin 'vim-airline/vim-airline'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Smooth Scroll
Plugin 'terryma/vim-smooth-scroll'

"Normal mode
noremap <silent> <c-u> :call smooth_scroll#up(40, 20, 6)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(40, 20, 6)<CR>

" smooth_scroll is broken in visual mode currently - unmap
vnoremap <silent> <c-u> <c-u>
vnoremap <silent> <c-d> <c-d>

" EditorConfig
Plugin 'editorconfig/editorconfig-vim'

" NERD Commenter
Plugin 'scrooloose/nerdcommenter'

" Autoclose
Plugin 'spf13/vim-autoclose'
let g:autoclose_vim_commentmode = 1

" Auto Pairs
" Plugin 'jiangmiao/auto-pairs'

" Closetag.vim
Plugin 'alvan/vim-closetag'

" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press > in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Language-based Plugins
" JS/JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set runtimepath^=~/.vim/bundle/ctrlp.vim

set noswapfile     " Don't make backups.
set nowritebackup " Even if you did make a backup, don't keep it around.
set nobackup

" Intuitive backspacing
set backspace=indent,eol,start

" Custom Padilla
set background=dark
set t_Co=256

" colorscheme nord
" colorscheme palenight
" colorscheme dracula
" colorscheme spacegray
" let g:spacegray_underline_search = 1
" let g:spacegray_low_contrast = 1

" colorscheme skull

" colorscheme one
let g:airline_theme='one'
" let g:one_allow_italics=1

" Transparency
if has("gui_macvim")
    set transparency=2
    colorscheme one
endif

" Syntax Highlighting
syntax on

" File Type Detection
filetype plugin indent on

set guicursor=a:hor10-Cursor
" set guifont=Roboto\ Mono:h12
set guifont=Meslo\ LG\ S:h12
" set guifont=SF\ Mono:h12
" set guifont=Monaco:h11

set linespace=0
set tabstop=4
set shiftwidth=4
set expandtab
set number
set autoindent
set smartindent

set wildmenu
set wildmode=full
set wildignore+=*/node_modules/**
" Including this messes up fugitive in git mergetool:
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
set sm!  " show matching brace/parent

" Searching
set incsearch
set hlsearch
set hidden

set ignorecase
set smartcase

" show whitespace
set listchars=space:·
set list

set foldmethod=indent

" remap
vmap <Tab> >gv
vmap <S-Tab> <gv

" removes the trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Opens up NERDTree on startup
let g:nerdtree_tabs_open_on_gui_startup=2

" Custom functionality so we can files in new a tab
" https://github.com/scrooloose/nerdtree/issues/323
fun! s:MyNERDTreeSetting()
  fun! s:DoubleClickBehavior()
    if match(getline('.'), '▸') == -1 && match(getline('.'), '▾') == -1
      map <buffer> <2-LeftMouse> t
    else
      map <buffer> <2-LeftMouse> o
    endif
  endfun

  autocmd CursorMoved * call s:DoubleClickBehavior()
endfun

autocmd WinEnter * if &ft == 'nerdtree' | call s:MyNERDTreeSetting() | endif

" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END
