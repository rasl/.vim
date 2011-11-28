set number 
set mouse=a

set nocompatible               " iMproved
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set smarttab 

set expandtab
"set noai


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""""""""""""""""""""""
" let Vundle manage Vundle
" required! 
""""""""""""""""""""""""""""
" need git :)
Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""
"	interface 
""""""""""""""""""""""""""""
" NERDTree
Bundle 'scrooloose/nerdtree'
"silent! nmap <silent> <Leader>p :NERDTreeToggle<CR> "
"nnoremap <silent> <C-f> :call FindInNERDTree()<CR>  "
nmap <silent><Leader><Leader>p :NERDTreeToggle<CR>

" NERDCommenter
Bundle 'scrooloose/nerdcommenter'

" bufexplorer
Bundle 'slack/vim-bufexplorer'
"  '\be' (normal open)  or
"  '\bs' (force horizontal split open)  or
"  '\bv' (force vertical split open)
"

" project explorer (save, open project and etc)
Bundle 'project.tar.gz'
nmap <silent><Leader><Leader>l <Plug>ToggleProject


""""""""""""""""""""""""""""
"	color schemes (themes) 
""""""""""""""""""""""""""""
set t_Co=256
Bundle 'Color-Sampler-Pack'
" dark
nmap <silent><Leader><Leader>t5 :colorscheme railscasts<CR>
" dark 
nmap <silent><Leader><Leader>t4 :colorscheme wombat256<CR>
" white
nmap <silent><Leader><Leader>t3 :colorscheme autumn2<CR>
" transparent contrast
nmap <silent><Leader><Leader>t2 :colorscheme peachpuff<CR>
" transparent no contrast
nmap <silent><Leader><Leader>t1 :colorscheme neon<CR>
" set default
colorscheme neon

""""""""""""""""""""""""""""
"	highlight, aligning, complete and etc
""""""""""""""""""""""""""""
" highlight tabs
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
" default <Leader>ig

" insert space, example:
" one   = 1
" two   = 2
" three = 3
" four  = 4
Bundle "godlygeek/tabular"
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" supertab (auto complete)
Bundle 'ervandew/supertab'

" surround Delete/change/add parentheses/quotes/XML-tags/much more with ease 
Bundle 'tpope/vim-surround'

" ZenCoding
Bundle 'mattn/zencoding-vim'

" snipMate
Bundle 'msanders/snipmate.vim'

"set encoding=utf8
"set listchars=tab:▸·,eol:¬,precedes:«,extends:»,trail:·
"set listchars=tab:>-,eol:<,trail:%
"nmap <Leader><Leader>l :set list!<CR>


""""""""""""""""""""""""""""
"	html 
""""""""""""""""""""""""""""
" w3cvalidator
Bundle 'dekomote/w3cvalidate.vim'

""""""""""""""""""""""""""""
"	php 
""""""""""""""""""""""""""""
" PHP syntax file
" PHP 5.1.4 http://www.vim.org/scripts/script.php?script_id=1571
Bundle 'php.vim--Hodge'
" PHP > 5.3 http://www.vim.org/scripts/script.php?script_id=2874
Bundle 'StanAngeloff/php.vim'

" DBGp (xdebug)
" for run http://example.com/index.php?XDEBUG_SESSION_START=1
" need php5-xdebug
Bundle 'DBGp-Remote-Debugger-Interface'
let g:debuggerPort = 9000
let g:debuggerTimeout = 10

" PDV--phpDocumentor-for-Vim (phpDocumentator)
Bundle 'PDV--phpDocumentor-for-Vim'
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

" check syntax php, js, ruby
" need php-cli
Bundle 'tomtom/checksyntax_vim'
nmap <silent><Leader><Leader>c :CheckSyntax<CR>

" php indenting (with html code)
Bundle 'PHP-correct-Indenting'

" complete
Bundle 'phpcomplete.vim'
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" reformatting =

""""""""""""""""""""""""""""
"	tags 
""""""""""""""""""""""""""""
" need ctags
Bundle 'taglist.vim'
nmap <silent><Leader><Leader>o :TlistToggle<CR>

" powerfull tool for search definition in all files
Bundle 'Source-Explorer-srcexpl.vim'
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsKey = "<Leader><Leader>u" 
nmap <silent><Leader><Leader>i :SrcExplToggle<CR>

" indexer (auto index tags (ctags) for current project (use plugin project))
" very slow plugin ?????
"Bundle 'indexer.tar.gz'
"let g:indexer_disableCtagsWarning=1
"let g:indexer_enableWhenProjectDirFound=0
"Bundle 'now/vim-man'
"Bundle 'browser.vim'
" need lynx (for browse documentation)
"Bundle 'browser.vim--Brown'
"Bundle 'Php-Doc--Jeffery'
"Bundle 'Lynx-Offline-Documentation-Browser'

""""""""""""""""""""""""""""
"	syntax 
""""""""""""""""""""""""""""
filetype on                   " required system plugins (hightlight for many system files)
filetype plugin indent on     " required special plugins

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

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
