
set number 

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" NERDTree
Bundle 'scrooloose/nerdtree'
"silent! nmap <silent> <Leader>p :NERDTreeToggle<CR> "
"nnoremap <silent> <C-f> :call FindInNERDTree()<CR>  "
nmap <Leader>p :NERDTreeToggle<CR>

" NERDCommenter
Bundle 'scrooloose/nerdcommenter'

" bufexplorer
Bundle 'slack/vim-bufexplorer'
"  '\be' (normal open)  or
"  "  '\bs' (force horizontal split open)  or
"  "  '\bv' (force vertical split open)
"

" DBGp (xdebug)
" for run http://example.com/index.php?XDEBUG_SESSION_START=1
Bundle 'DBGp-Remote-Debugger-Interface'
let g:debuggerPort = 9000
let g:debuggerTimeout = 10

" PDV--phpDocumentor-for-Vim (phpDocumentator)
Bundle 'PDV--phpDocumentor-for-Vim'
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
