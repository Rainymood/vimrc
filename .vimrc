
 
"=============================================================================="
"                   __                 __  ___                                 "
"                  / /____ _ ____     /  |/  /___   ____   ____   ___          "
"             __  / // __ `// __ \   / /|_/ // _ \ / __ \ / __ \ / _ \         "
"            / /_/ // /_/ // / / /  / /  / //  __// /_/ // /_/ //  __/         "
"            \____/ \__,_//_/ /_/  /_/  /_/ \___// .___// .___/ \___/          "
"                _   __ (_)____ ___   _____ ____/_/    /_/                     "
"               | | / // // __ `__ \ / ___// ___/                              "
"             _ | |/ // // / / / / // /   / /__                                "
"            (_)|___//_//_/ /_/ /_//_/    \___/                                "
"                                                                              "
"=============================================================================="
                                                                               
" Settings {{{

syntax on
filetype indent on
filetype plugin on 

set nocompatible        " ???
set mouse=a             " Enable mouse in all modes 
set cmdheight=2         " Gets rid of all the press enter to continue
set number              " Displays line numbers on the left
set tw=80               " Set textwidth hard wrap to 80 chars 
set nowrap              " Disable wrap 
set wildmenu            " Better CLI autocomplete
set ruler               " show position in statusbar
set showcmd
set cmdheight=2         " Removes press enter to continue 
set backspace=indent,eol,start "Allow backspace in insert mode
set cursorline
set smartindent 

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

" Set foldmethod to fold-markers {{{,}}} (no shit) zR to open, zM to close 
set foldmethod=marker 
" Set to no fold on open file
set foldlevelstart=99 

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
" let g:AirlineToggle=1

" remove right-hand and left-hand scroll bar 
set guioptions-=r  
set guioptions-=L  

" Else LaTeX gets weird 
set conceallevel=0

" Reload file if changed from outside
set autoread

" }}}

" Visual {{{

let base16colorspace=256 " Access colors present in 256 colorspace
set t_Co=256 " 256 color mode

if !has("gui_running")
    "let g:solarized_termtrans=1
    "let g:solarized_termcolors=256
    " This fixed my solarized issues in TERMINAL!!!
    " Be sure to preset the colours in iterm2 as import colors 
    let g:solarized_termcolors = 16
    let g:solarized_termtrans  = 16
    let g:solarized_contrast   = "high"
    let g:solarized_visibility = "high"
endif
set background=dark
"set background=light
colorscheme solarized
"colorscheme badwolf
"colorscheme space-vim-dark

"}}}

" Mappings {{{

let mapleader = ","
imap kj <Esc>
nmap Y y$

" gj and gk to go quicker 
nnoremap gj 10j
nnoremap gk 10k

" Center cursor when moving up/down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" When jump to next match also center screen
noremap n nzz
noremap N Nzz

" Reselect after indenting
vnoremap < <gv
vnoremap > >gv

" Quickquit & Quicksave
noremap <Leader>s :w!<CR>
noremap <Leader>e :q<CR> 

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

" Remap space to folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Map <C-L> (redraw screen) to also turn off search highlighting until the
nnoremap <Leader>l :nohl<CR><C-L>

" <Leader>v vertical split edit vimrc
map <Leader>v :vsp $MYVIMRC<CR><C-W> 

" <Leader>V edit vimrc in current window 
map <Leader>V :e $MYVIMRC<CR>

" Remap <C-T> write and compile tex
map <C-t> :w<CR><leader>ll

" Start interactive EasyAlign in visual mode (e.g. vipga)
" ex. vipga= (visual inner paragraph GA around =)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"--------------------------------------------------------------------------------
"                               __       _            
"                              / /  __ _| |_ _____  __
"                             / /  / _` | __/ _ \ \/ /
"                            / /__| (_| | ||  __/>  < 
"                            \____/\__,_|\__\___/_/\_\
"                                                     
"--------------------------------------------------------------------------------
"
" Latex bindings. ASCII font is Ogre from
" http://patorjk.com/software/taag/#p=display&f=Ogre&t=Latex 
" 
" 2-12-2016 I am officially a retard. I just realized that there are
" a shitton of bindings available for latex already ... such as `/ for fraction
" .. haha god this is hilarious. 
"
" 23-3-2017 I think my most used bindings are like <sdf> for _ and the leader
" align thingy. Its so neat.  

" Remapped imap dfd to _
" I just found out that __ => _{}++
imap dfd _
imap <Leader>h \hat{}
imap <Leader>d \dot{}
imap <Leader>dd \ddot{}
imap <Leader>b {}
imap <Leader>p () 
imap <Leader>B []
imap <Leader>c <F7>

imap FRE \red{}
imap FGE \gray{}

" Remap <Leader>a to align environment
map <Leader>a i%<CR>%<CR><++><Esc>kO<Esc><f5>8<CR>kj<C-l>i<Tab>

" <Leader>A to <f5>8<CR>kj<C-l>i<Tab> (align with label)
map <Leader>A i%<CR>%<Esc>O<Esc><f5>7<CR>kj<C-l>i<Tab>

" Retarded shit because of automated indenting lol 
map <Leader>b <Esc>i\textbf{}kj<<f{a

" Leader t => text
" Leader it => italix text 
imap <Leader>t <Esc>a\text{}
imap <Leader>it <Esc>a\textit{}

" Took 10 minutes to write this partial derivative macro. 
" Remaps leader p to partial derivative and entering you in the first frac
imap <Leader>p \frac{\partial <++>}{\partial <++>}<++>kj0i<C-j>

" Remaps <Leader>sq to square root with cursor in the middle and bullet esc
imap <Leader>sq \sqrt{}

" Annoying \{ \} map for latex 
imap <Leader>set \{\}<++><Esc>F\i

imap <Leader>fr \frac{<++>}{<++>}<++><Esc>0i<C-j>

" Imap sum with lower upper and outside escape option 
imap `o \sum_{<++>}^{<++>}<++><Esc>0i<C-j>

" Imap sum with lower upper and outside escape option 
imap <Leader>ss \subsection*{}

" tingy 9 to inverse
imap `9 ^^-1<C-j>

" imap `` ^

" I use these so often 
imap fds \
imap sdf _
imap 44 $$
"imap == &= 

imap Rn \R^n

"nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
"imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %H:%M ")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %H:%M ")<CR>

imap <F4> <C-R>=strftime("%Y-%m-%d %a ")<CR>
nmap <F4> i<C-R>=strftime("%Y-%m-%d %a ")<CR><Esc>

"nmap <Leader>f <F3>
"imap <Leader>f <F3>

" 2017-10-23 Mon 11:38  Remap leader l to anki latex bind 
imap <Leader>l []latex<Esc>A[]/latex<Esc>0i<C-j>$$

imap avg \frac{1}{N}\sum_{i=1}^{N}

imap <Leader>rb \bar{}r<C-j>

" Datetime
"nmap <F3> i<C-R>=strftime("%Y-%m-%d %a  ")<CR><Esc>
"imap <F3> <C-R>=strftime("%Y-%m-%d %a  ")<CR>

"nmap <F4> i<C-R>=strftime("%H:%M ")<CR><Esc>
"imap <F4> <C-R>=strftime("%H:%M  ")<CR>

" Turn paragraph into gray 
map <Leader>gg vipgqysip{i\graykj}

map <F5> <Esc>:Vimwiki2HTMLBrowse<CR>

"-------------------------------------------------------------------------------- 

"<Leader>ss toggles spellcheck
map <leader>ss :setlocal spell!<cr>

" Easymotion hjkl bindings 
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion


" Tab between buffers
" Unless in .wiki file, then tab is jump to next link 
"noremap <tab> <c-w><c-w>

" }}}

" Vundle {{{

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

" 2017-10-20 Fri 14:35  Installed the vim-seek plugin

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

" Couldn't enter map with <cr>. This line fixed that for me
" OLD FIX (DOESNT WORK)
"let g:NERDTreeDirArrows=0 
" NEW FIX (Does work as of 27-05-2016)
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '>'

" }}}

" Other {{{ 

"" Paths for vimwiki
let g:vimwiki_list = [{
  \ 'path': '$HOME/vimwiki',
  \ 'template_path': '$HOME/vimwiki/templates',
  \ 'template_default': 'default',
  \ 'template_ext': '.html'}]

" Resources Vim on save
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

" Sudoku specific
map <Leader>r :!python sudoku.py<CR>

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

" Set conceallevel to = 0 for tex files 
au! FileType tex setlocal conceallevel=0
au! FileType tex set nofoldenable    " disable folding 

" if :set ft gives plaintex instead of latex, which it doesnt but still it might
" be worth trying out here. 
let g:tex_flavor='latex'


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Set filetype for markdown automatically 
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Nerdcomenter
" <Leader>cc for comment
"

let g:goyo_width = 100

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

set nosmartindent

map <leader>r :NERDTreeFind<cr>


