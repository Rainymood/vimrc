" Author: Jan Meppe
" v1.0.0 - 2020-06-30 - I like VScode but Vim is my baby

" Enable syntax highlighting
syntax on               

" Enable filetype plugin and indent
filetype plugin indent on 

" Set indent (perhaps remove smartindent, had it disabled) 
set autoindent 
set smartindent 

" Disable Vi emulation
set nocompatible

" Enable mouse in all modes 
set mouse=a

" Get rids of 'press enter to continue'
set cmdheight=2

" Set relative line numbers 
set rnu

" Set textwrap to 80 but disable (gq works with 80) 
set tw=80
set nowrap              " Disable wrap 

" Better CLI autocomplete
set wildmenu

" Show position in statusbar
set ruler

" Shows the command that you are typing as you are typing it
set showcmd

" Allow backspace in insert mode
set backspace=indent,eol,start

" Highlight current cursor line
set cursorline

" Ignore case when searching, highlight results 
set ignorecase
set smartcase
set hlsearch

" Split right and below instead of left and top
set splitright
set splitbelow 

" Disable swap and backup files 
set nobackup            
set nowritebackup
set noswapfile

" Tabs for indentation
set tabstop=4   
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Removes "E37: No write since last change (add ! to override)".
set hidden 

" Default airline only pops up when creating a split
set laststatus=2
let g:airline_powerline_fonts = 1

" remove right-hand and left-hand scroll bar 
set guioptions-=r  
set guioptions-=L  

" Else LaTeX gets weird 
set conceallevel=0

" Reload file if changed from outside
set autoread

" Access 256 color mode
let base16colorspace=256 
set t_Co=256

" This fixed my terminal solarized issues. 
" Make sure to preset colors in iterm2 as import colors! 
if !has("gui_running")
    let g:solarized_termcolors = 16
    let g:solarized_termtrans  = 16
    let g:solarized_contrast   = "high"
    let g:solarized_visibility = "high"
endif
set background=dark
colorscheme solarized

" Mappings
let mapleader = ","

" 10/10 best vim binding ever
imap kj <Esc>  
nmap Y y$

" Center cursor when moving up/down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" When jump to next match also center screen
noremap n nzz
noremap N Nzz

" Reselect after indenting
vnoremap < <gv
vnoremap > >gv

" Remap cntrl + n to open Nerdtree
"map <C-n>:Explore<CR>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Show different background for col >80
 let &colorcolumn=join(range(81,999),",")

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
nnoremap <Leader>l :nohl<CR><C-L>

" <Leader>v vertical split edit vimrc
map <Leader>v :vsp $MYVIMRC<CR><C-W> 

" F3 to insert 2020-06-30 Tue 10:12 
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %H:%M ")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %H:%M ")<CR>

" F4 to insert 2020-06-30 Tue 
imap <F4> <C-R>=strftime("%Y-%m-%d %a ")<CR>
nmap <F4> i<C-R>=strftime("%Y-%m-%d %a ")<CR><Esc>

"<Leader>ss toggles spellcheck
map <leader>ss :setlocal spell!<cr>

" Easymotion hjkl bindings 
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" ???
set rtp+=~/.vim/bundle/Vundle.vim

" Ctrl + P
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.aux " Ignore some files   

call vundle#begin()

" Let Vundle manage Vundle 
Plugin 'gmarik/Vundle.vim' 

" My Vundle plugins 
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " Snippets are separate from the engine
Plugin 'junegunn/goyo.vim'
Plugin 'goldfeld/vim-seek'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" see :h vundle for more details or wiki for FAQ

" Pathogen
execute pathogen#infect()

" NEW FIX (Does work as of 27-05-2016)
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '>'

" Paths for VimwWiki
let g:vimwiki_list = [{
  \ 'path': '$HOME/vimwiki',
  \ 'template_path': '$HOME/vimwiki/templates',
  \ 'template_default': 'default',
  \ 'template_ext': '.html'}]

" Reloads .vimrc on save
if has("autocmd")
augroup UniqueNameForYourAuGroup
    " Clear autocmds for this group
    autocmd!
    " Add your autocommands here
    autocmd! BufWritePost .vimrc nested source <afile>
augroup end
endif

" :help buffer on left
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" }}} 

" Brief vim surround help 
" Vim-surround cheatcheet
" ds<target>                     delete surroundings
" cs<target><replacement>        change surroundings
" cS                             change surroundings; and put surrounded text on
"                                newline
" ) b
" } B
" ] r
" > a
"

" Set filetype for markdown automatically 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Cycle through buffers fast
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

map <leader>r :NERDTreeFind<cr>


