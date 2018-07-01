""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ''
"                     \\  //  ||  '||),,(|,  '||''| .|'',
"                      \\//   ||   || || ||   ||    ||
"                  ..   \/   .||. .||    ||. .||.   `|..'
"
"                      vim configuration file (.vimrc)
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOAD PLUGINS VIA PATHOGEN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('ivim')
  runtime bundle/vim-pathogen/autoload/pathogen.vim
endif
execute pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SET COLORSCHEME
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Available Highlight Colors:
" Black, Gray, Grey, LightGray, LightGrey, DarkGray, DarkGrey, White
" Red, LightRed, DarkRed, Yellow, LightYellow, DarkYellow, Brown
" Green, LightGreen, DarkGreen, Cyan, LightCyan, DarkCyan
" Blue, LightBlue, DarkBlue, Magenta, LightMagenta, DarkMagenta

" OVERRIDE HIGHLIGHTS:
if has('autocmd')
  augroup coloroverride
    autocmd!
    " Override Line Number Color:   
    "autocmd ColorScheme * highlight LineNr ctermfg=White guifg=White
    "autocmd ColorScheme * highlight LineNr ctermbg=DarkGray guibg=DarkGray
    " Override Cursor Line Number Color:
    autocmd ColorScheme * highlight CursorLineNr ctermfg=Black guifg=Black gui=none
    autocmd ColorScheme * highlight CursorLineNr ctermbg=LightRed guibg=LightRed gui=none
  augroup END
endif

"colorscheme base16-atelier-cave        " black
"colorscheme base16-atelier-sulphurpool " blue
"colorscheme base16-black-metal-venom   " black
colorscheme base16-chalk               " dark gray
"colorscheme base16-circus              " dark gray
"colorscheme base16-grayscale-dark      " black
"colorscheme base16-harmonic-dark       " dark blue
"colorscheme base16-irblack             " black
"colorscheme base16-materia             " dark teal
"colorscheme base16-monokai             " dark brown
"colorscheme base16-nord                " blue
"colorscheme base16-railscasts          " dark gray
"colorscheme base16-solarflare          " blue
"colorscheme base16-tomorrow-night      " black
"colorscheme cobalt2                    " blue
"colorscheme lucariox                   " dark blue
"colorscheme material                   " dark teal
"colorscheme plain                      " dark gray
"colorscheme simplifysimplify-dark      " dark gray
"colorscheme snow                       " dark blue
"colorscheme stellarized_dark           " dark blue


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOMIZATIONS FOR PROGRAMMERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
syntax enable                           " enable syntax highlighting
filetype on                             " automatically detect file type
filetype plugin on                      " auto load filetype plugins
filetype indent on                      " auto load file indent settings


" Tab vs. Space Customizations
set tabstop=2                           " number of visual spaces per tab
set softtabstop=2                       " number of spaces in tab when editing
set shiftwidth=2                        " number of spaces to indent/unindent
set expandtab                           " tabs are spaces


" Line Number Customizations
set number                              " show line numbers
set relativenumber                      " show relative line numbers
augroup numbertoggle                    " auto toggle line numbers by mode
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup end


" Text Width, Rule & Word Wrap Customizations
set colorcolumn=80                      " show ruler at column 80
set textwidth=80                        " set wrap width
set wrap                                " word wrap visually
set linebreak                           " only break lines when pressing Enter
set nolist
set formatoptions+=t


" Bracket and Block Customizations
set showmatch                           " Highighlight matching () {} [] 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH CUSTOMIZATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                            " highlight search results
set noincsearch                         " do not highlight incremental search


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DEFAULT FILE ENCODING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termencoding=utf8                   " set default encoding to utf-8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CLIPBOARD CUSTOMIZATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed                   " yank to os clipboard


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HELP CUSTOMIZATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let base16colorspace=256

if !has('gui_running')
  set t_Co=256
  set termguicolors
  set background=dark
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  set guifont=CamingoCodeRegular.ttf:h17
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NVIM CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')  
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-LIGHTLINE CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode                          " hide duplicate mode identifier
set laststatus=2                        " configure vim-airline

" Uncomment to Set Middle Status Bar Color to Colorscheme Background
"let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
"let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'None' ] ]
"let s:palette.inactive.middle = s:palette.normal.middle
"let s:palette.tabline.middle = s:palette.normal.middle

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOMIZE CURSORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[4 q"
let &t_EI = "\<esc>[2 q"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow Use of j k $ and 0 to navigate wrapped lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
onoremap <silent> j gj
onoremap <silent> k gk


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>"

"    <space>ev                         
"    edit .vimrc
nmap <leader>ev :e $MYVIMRC<cr>

"    <space>so                         
"    save & source .vimrc (reload settings in current vim session)
nmap <leader>so :w<cr><bar>:source $MYVIMRC<cr><bar>:noh<cr><bar>:echom "sourcing .vimrc"<cr>

"    <space>sp                         
"    spell check on
nmap <leader>sp :setlocal spell<cr>

"    <space>ns                         
"    spell check off (no spelling)
nmap <leader>ns :setlocal nospell<cr>

"    <space>wc                         
"    display word count
nmap <leader>wc g<C-g>




