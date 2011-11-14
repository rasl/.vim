
set number 

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
"silent! nmap <silent> <Leader>p :NERDTreeToggle<CR> "
"nnoremap <silent> <C-f> :call FindInNERDTree()<CR>  "
nmap <Leader>p :NERDTreeToggle<CR>

Bundle 'scrooloose/nerdcommenter'

Bundle 'slack/vim-bufexplorer'
"  '\be' (normal open)  or
"  "  '\bs' (force horizontal split open)  or
"  "  '\bv' (force vertical split open)
"


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
