" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc

":version 4.0
"set nu

set ts=4
set ai
set shiftwidth=4
set expandtab
retab


au VimEnter Makefile set noexpandtab
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
  	return "\<Tab>"
 else
 	return "\<C-N>"
endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>

set showmode
set showmatch
set showcmd
set ruler
set redraw
set nocompatible	" Use Vim defaults (much better!)
set backspace=2		" allow backspacing over everything in insert mode
"set textwidth=78		" always limit the width of text to 78
set nobackup		" keep a backup file
"set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers

set incsearch	" Incremental search
set ttyfast 	" Fast terminal
set shortmess=at		" shortmess
set ww=<,>,[,]  " which wrap
set wrapscan
set shell=/usr/local/bin/bash
set smartcase
"" set wildignore=*.o,a.out,*.lo
"" set wildmode=longest:full
"" set wildmenu
set scrolloff=3
set magic
set ttybuiltin
set wrapmargin=1
set showbreak="++>  "

" map ` :w
" mapping key F1 to make
map <F1> :make
" mapping key F3 to toggle ignore case
map <F3> :se ic!
" mapping key F2 to save
map <F2> :w

" mapping keys <Alt-j> and <Alt-k> for moving up and down to various buffers
map <M-j> ^Wj
map <M-k> ^Wk
imap <M-j> <ESC>^Wj
imap <M-k> <ESC>^Wk

" Emacs like options ^A ^E Alt-D Alt-f and Alt-b
imap <C-A> <ESC>I
imap <C-E> <ESC>A
imap <ESC>f <ESC>lwi
imap <ESC>b <ESC>lbi
imap <ESC>d <ESC>dwi
map  <C-E>  A
"imap <BS> <Left><Del>
map <BS> hx
"cmap <BS> <Del>

set formatoptions=tcr2oq
set helpheight=0
" I want the current window to be atleast 10 lines large
set winheight=10

" Switch on search pattern highlighting.
set hlsearch
" have a key mapping to toggle it
:map <F4> :set hls!

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" enable filetype plugin
filetype plugin on

" Don't use Ex mode, use Q for formatting
map Q gq

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" matchit

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Installed

" www.vim.org/scripts/script.php?script_id=301
" $ADDED/xml.vim

" www.vim.org/scripts/script.php?script_id=39
" copied macros/matchit.vim to plugin/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML

map <Leader>x :set filetype=xml<CR>
  \:source $VIMRUNTIME/syntax/xml.vim<CR>
  \:set foldmethod=syntax<CR>
  \:source $VIMRUNTIME/syntax/syntax.vim<CR>
  \:colors peachpuff<CR>
  \:source $ADDED/xml.vim<CR>
  \:iunmap <buffer> <Leader>.<CR>
  \:iunmap <buffer> <Leader>><CR>
  \:inoremap \> ><CR>
  \:echo "XML mode is on"<CR>
  " no imaps for <Leader>
  "\:inoremap \. ><CR>

if has("autocmd")

" Remove ALL auto-commands.  This avoids having the autocommands twice when
" the vimrc file is sourced again.
"autocmd!

"autocmd BufEnter *.java set cindent
"autocmd BufEnter *.java set comments=sr:/**,mb:*,el:*/,sr:/*,mb:*\ ,el:*/,://
"autocmd BufEnter *.java set formatoptions=cr2o

" .bbl files are bibliography files for latex. So,..
"autocmd BufEnter *.bbl source $VIM/syntax/tex.vim

" Comments etc. for latex files
" make = latex <filename> (without extension)
"autocmd BufEnter *.tex set makeprg=latex\ %:r
"autocmd BufEnter *.tex,*.bbl set comments=:%
"autocmd BufEnter *.tex,*.bbl set formatoptions=crt2o

" Comments in shell scripts and .rc files usually start with
"autocmd BufEnter *.sh,*.bash,.*rc set comments=:#
"autocmd BufEnter *.sh,*.bash,.*rc set formatoptions=cr2oq

"autocmd BufNewFile Makefile,makefile :r ~/lib/Makefile
"autocmd BufEnter Makefile,makefile set noet

"autocmd BufEnter .Xdefaults set comments=:!

"autocmd BufEnter .exrc, .gvimrc, .vimrc set comments=:\"
"autocmd BufEnter .exrc, .gvimrc, .vimrc set formatoptions=cr2oq

autocmd BufEnter *.yacc set syntax=yacc
autocmd BufEnter *. lex syntax=lex

" Set some sensible defaults for editing C-files
augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.c,*.h,*.cpp,*.cc,*.pl,*.tcl set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END


endif " has ("autocmd")

" Vim5 comes with syntaxhighlighting. If you want to enable syntaxhightlighting
" by default uncomment the next three lines. 
if has("syntax")
  syntax on		" Default to no syntax highlightning 
endif

" folding using regular expression
set foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\|\|(getline(v:lnum+1)=~@/)?1:2
map \z :set foldmethod=expr foldlevel=0 foldcolumn=2<CR>
				


" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.


set nocompatible                        " Use vim advance settings
set autoindent                          " Auto-indent on
set tabstop=4                           " Use 4 spaces for tabs
set shiftwidth=4                        " 4 spaces for autoindent
set expandtab                           " Use space instead of tabs
"set foldcolumn=4                       " Colums for fold display
"set incsearch                          " Incremental search
"set hlsearch                           " Highlight search hits
"set showcmd                            " Show panding commands
"set cmdheight=1                        " lines for command window
"set laststatus=2                       " Always show status line
set backspace=indent,eol,start          " Backspace over everyting
set history=50                          " Save at most 50 commands
"set ruler                              " show ruler
"set showmatch                          " Display matching paren
"set matchtime=2                        " Be breif when displaying the match
set nobackup                            " No backups
"set visualbell                         " Use visual bell
"set mouse=nv                           " Mouse in normal and visual
"set viminfo='100,f1,rE:,:100,/100      " Vim info options
set lazyredraw                          " Don't redraw on macro execute
set noerrorbells                        " Don't make noise
set autoread                            " Re-read if modified
"set backupcopy=yes                     " Save resources
"set diffopt=filler,iwhite              " Diff options
set nostartofline                       " Keep cursor column when moving
set number                              " Show number of line on left
"set helplang=en,cn                     " Language of help
"set enc=UTF-8
"set fenc=UTF-8
"set fencs=UTF-8,chinese
syntax on                               " Syntax Highlight on
set smartindent                         " smart indent on
set ignorecase                          " do case insensitive matching
set shell=bash                          " use bash with !command
set paste
"set columns=100 lines=40               " use 100x40 instead of 80x20
" color scheme configuration: related color files are in
"/usr/share/vim/vim70/clorslor scheme configuration: related color files are in
"/usr/share/vim/vim70/c"colorscheme darkblue
augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END 

filetype plugin indent on
function! GetJavaIndent_improved()
    let theIndent = GetJavaIndent()
    let lnum = prevnonblank(v:lnum - 1)
    let line = getline(lnum)
    if line =~ '^\s*@.*$'
        let theIndent = indent(lnum)
    endif
    return theIndent
endfunction
setlocal indentexpr=GetJavaIndent_improved()

