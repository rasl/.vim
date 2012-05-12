"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" description: vim + bundle + .vimrc
"" author: Rassolov Dmitriy
"" http://github.com/rasl/vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" TODO: сделать краткий список шорткатов (гератор такого списка???)
"

set nocompatible " без обратной совместимоси с vi

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Подключение и запуск vundle
" нужен git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" подключение плагинов
"	плагины обшего назначения
Bundle 'Color-Sampler-Pack'
Bundle 'sjl/gundo.vim'
Bundle "godlygeek/tabular"
Bundle 'scrooloose/nerdcommenter'
Bundle 'slack/vim-bufexplorer'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-surround'
Bundle 'DeleteTrailingWhitespace'
Bundle 'project.tar.gz'
Bundle 'taglist.vim'
"Bundle 'ervandew/supertab'
Bundle 'indexer.tar.gz'
 "эти два нужны только для indexer.tar.gz
Bundle 'DfrankUtil'
Bundle 'vimprj'

"	php
" корректное отображение php синтаксиса
Bundle 'PHP-correct-Indenting'
" этот ещё корректнее (подсвечивает разными цветами уровни вложенности)
Bundle 'php.vim--Hodge'
Bundle 'DBGp-Remote-Debugger-Interface'
" проверка синтаксиса php
Bundle 'tomtom/checksyntax_vim'
" дополнение для функций и ключевых слов php
Bundle 'phpcomplete.vim'
" стиль кодирования
Bundle 'phpcodesniffer.vim'
" мануалы
Bundle 'Yii-API-manual-for-Vim'

"	html
Bundle 'othree/html5.vim.git'
" подсветка противоположных тэгов
Bundle 'gregsexton/MatchTag.git'

"	 CSS/LESS
Bundle 'git://github.com/hail2u/vim-css3-syntax.git'
" подсветка цветов по их кодам
Bundle 'ap/vim-css-color.git'
Bundle 'groenewege/vim-less.git'
Bundle 'miripiruni/vim-better-css-indent.git'
" сортировки css свойств
Bundle 'miripiruni/CSScomb-for-Vim.git'

"	javascript
Bundle "itspriddle/vim-jquery.git"

"	git
Bundle 'tpope/vim-fugitive'

"	svn (и другие)
Bundle 'vcscommand.vim'



"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'ervandew/supertab'
"Bundle 'msanders/snipmate.vim'
"Bundle 'dekomote/w3cvalidate.vim'
"Bundle 'PDV--phpDocumentor-for-Vim'
"Bundle 'Source-Explorer-srcexpl.vim'

"Bundle 'mileszs/ack.vim'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Все мое протраснство пользовательских функций начинается с <Leader><Leader>
" по умолчанию <Leader> равен нажатию \
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	let mapleader="\\" " пусть так и остается




"
"	syntax
"
filetype on					  " required system plugins (hightlight for many system files)
filetype plugin indent on	  " required special plugins

" Позволяем передвигаться с помощью hjkl в Insert mode зажав <Ctrl>
		imap <C-h> <C-o>h
		imap <C-j> <C-o>j
		imap <C-k> <C-o>k
		imap <C-l> <C-o>l


" Не бибикать!
        set visualbell " Use visual bell instead of beeping
        set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Оключаю стрелки
" Disable <Arrow keys>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	inoremap <Up> <NOP>
	inoremap <Down> <NOP>
	inoremap <Left> <NOP>
	inoremap <Right> <NOP>
	noremap <Up> <NOP>
	noremap <Down> <NOP>
	noremap <Left> <NOP>
	noremap <Right> <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки интерфейса через нативные возможности
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" номера строк
	set nonumber " не показывать номера строк
	" включение/выключение
	function! ToggleNumber()
		  if &number
			set nonumber
		  else
			set number
		  endif
		endfunction
	" key ==  <leader><leader>n
	nnoremap <silent> <leader><leader>n :call ToggleNumber()<CR>


" мышь
	set mouse=a " пытаться поддерживать мышь

" отступы и пробелы
	set autoindent				" Копирует отступ от предыдущей строки
	set smartindent				" Включаем 'умную' автоматическую расстановку отступов
	set noexpandtab				" Не заменять табы на пробелы !!!!
	set shiftwidth=4			" Размер сдвига при нажатии на клавиши << и >>
	set tabstop=4				" Размер табуляции
	set softtabstop=4
	" конвертация табов в пробелы и обратно
	function! ToggleTabsToSpaces()
		if &expandtab
			set noexpandtab
			retab!
		else
			set expandtab
			retab!
		endif
	endfunction
	" key ==  <leader><leader>e
	nnoremap <silent> <leader><leader>e :call ToggleTabsToSpaces()<CR>


" понимать русские буквы во всех режимах (кроме command-line)
	set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>


" переносы
	set wrap				" включаем перенос строк
	set linebreak			" перенос не разрывая слов
	" символ, который будет показан перед перенесенной строкой
	if has("linebreak")
		let &sbr = nr2char(8618).' ' " ↪
	endif
	" включение/выключение
	function! ToggleWrap()
		  if &wrap
			set nowrap
		  else
			set wrap
		  endif
		endfunction
	" key ==  <leader><leader>w
	nnoremap <silent> <leader><leader>w :call ToggleWrap()<CR>



" ширина текста
	set textwidth=80
	" если можно подсвечивать 80ый столбец
	if version >= 703
		set colorcolumn=80 " подсвечиваем 80 столбец
	end


" подсветка невидимых символов
	set list " включено
	highlight NonText guifg=#cecece
	highlight SpecialKey guifg=#cecece
	if has('multi_byte')
		if version >= 700
			set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×,eol:¬
		else
			set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_,eol:$
		endif
	endif
	" включение/выключение
	function! ToggleList()
		  if &list
			set nolist
		  else
			set list
		  endif
		endfunction
	" key ==  <leader><leader>l
	nnoremap <silent> <leader><leader>l :call ToggleList()<CR>


" подсветка строки, в которой находится курсор
	set cursorline

" количество цветов
	set t_Co=256

" быстрый вызов редактирования
	" файла из текущей директории
	" открыть в текущий буфер
	map <leader><leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
	" в split
	map <leader><leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
	" в vsplit
	map <leader><leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
	" в tab
	map <leader><leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
	" открыть текущую директорию
	" в текущий буфер
	map <leader><leader>eww :e .<CR>
	" в split
	map <leader><leader>ess :sp .<CR>
	" в vsplit
	map <leader><leader>evv :vsp .<CR>
	" в tab
	map <leader><leader>ett :tabe .<CR>


" Приводим в порядок status line
		function! FileSize()
			let bytes = getfsize(expand("%:p"))
			if bytes <= 0
				return ""
			endif
			if bytes < 1024
				return bytes . "B"
			else
				return (bytes / 1024) . "K"
			endif
		endfunction

		function! CurDir()
			return expand('%:p:~')
		endfunction

		function! Fenc()
			if &fenc !~ "^$\|utf-8" || &bomb
				return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
			else
				return ""
			endif
		endfunction

		set laststatus=2
		set statusline=
		set statusline+=%n:\ " buffer number
		set statusline+=%t\ " filename with full path
		set statusline+=%{&ff}\  " format dos/unix
		set statusline+=%m " modified flag
		set statusline+=\ \
		set statusline+=%{&paste?'[paste]\ ':''}
		set statusline+=%{&fileencoding}\ " кодировка
		set statusline+=\ \ %Y " type of file
		set statusline+=\ %3.3(%c%) " column number
		set statusline+=\ \ %3.9(%l/%L%) " line / total lines
set statusline+=\ \ %2.3p%% " percentage through file in lines
		set statusline+=\ \ %{FileSize()}
		set statusline+=%< " where truncate if line too long
		set statusline+=\ \ CurDir:%{CurDir()}


" spell cheking (проверка орфографии)
	" первый раз при запуске если не найдется русского словарика
	" в интерактивном режиме предложит скачать и т.д.
	if version >= 700
		set spelllang=
		set nospell			" по умолчанию проверка орфографии выключена
		" традиционное включение/выключение
		function! ToggleSpell()
			if &spell
				setlocal nospell
			else
				setlocal spell
			endif
		endfunction
		function! OnSpellRuEn()
			setlocal spell spelllang=ru_yo,en_en
		endfunction
		function! OnSpellEn()
			setlocal spell spelllang=en_en
		endfunction
		function! OnSpellRu()
			setlocal spell spelllang=ru_yo
		endfunction
		" включение/выключение
		nnoremap <silent> <leader><leader>s :call ToggleSpell()<CR>
		" проверка сразу 2х языков
		nnoremap <silent> <leader><leader>ser :call OnSpellRuEn()<CR>
		nnoremap <silent> <leader><leader>sre :call OnSpellRuEn()<CR>
		" только английский
		nnoremap <silent> <leader><leader>se :call OnSpellEn()<CR>
		" только русский с (учетом буквы ё)
		nnoremap <silent> <leader><leader>sr :call OnSpellRu()<CR>
	endif


" работа с конфигом самого vim
	" key ==  <leader><leader>v
	" открыть конфиг в новом tab
	nnoremap <silent><leader><leader>v :tabedit $MYVIMRC<CR>
	" подкгузка новых изменений
	nnoremap <silent><leader><leader>vv :source $MYVIMRC<CR>
	" автоподгрузка изменение (бывает сильно тупит)
	"if has("autocmd")
		"autocmd bufwritepost .vimrc source $MYVIMRC
	"endif


" история команд vim
	 set history=1000 " хранить поледнюю тысячу команд


" Поиск
	set incsearch " При поиске перескакивать на найденный текст в процессе набора строки
	set hlsearch " Включаем подсветку выражения, которое ищется в тексте
	set ignorecase " Игнорировать регистр букв при поиске
	set smartcase " не игнорировать регистр если есть большие буквы
	" после поиска остается подсветка найденых слов, что очень мешает
	" чтобы убрать:
	nnoremap <silent><leader><esc> :noh<CR>

" Автоматически менять директорию текущего файла
	autocmd BufEnter * lcd %:p:h


" Кодировки
	set encoding=utf-8
	set termencoding=utf-8 " Терминал в utf-8
	set fileencodings=utf8,cp1251,koi8r,cp866 " а вот файлы в любой
" Рекурсивное перекодирование всех файлов
" find . -name '*.txt' | while read i; do iconv -f WINDOWS-1251 -t UTF-8 "$i" >tmp; mv tmp "$i"; done




" Поиск и замена во всех открытых буферах http://vim.wikia.com/wiki/VimTip382
	function! Replace()
		let s:word = input("Replace " . expand('<cword>') . " with:")
		:exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
		:unlet! s:word
	endfunction
	noremap <silent><Leader><Leader>r :call Replace()<CR>


"
" Отключение меню в gvim
"
	set go= " по умолчанию отключаем
	function! ToggleGUINoise()
		if &go==''
			exec('se go=mTrL')
			echo "Show GUI elements"
		else
			exec('se go=')
			echo "Show no GUI elements"
		endif
	endfunction
	noremap <silent><leader><Leader>m :call ToggleGUINoise()<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Настройки плагинов общего назначения
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Цветовые схемы
" пакет стандартных цветовых схем
" Bundle 'Color-Sampler-Pack'
" для работы нужны 256 цветов
" set t_Co=256
	" темная
	nmap <silent><Leader><Leader>t5 :colorscheme railscasts<CR>
	" темная
	nmap <silent><Leader><Leader>t4 :colorscheme wombat256<CR>
	" светлая
	nmap <silent><Leader><Leader>t3 :colorscheme autumn2<CR>
	" прозрачная котрастная
	nmap <silent><Leader><Leader>t2 :colorscheme peachpuff<CR>
	" прозрачная не контрастная
	nmap <silent><Leader><Leader>t1 :colorscheme neon<CR>
	" set default
	colorscheme neon



" Древовидный вид истории изменений
" (очень крутая штука, требует python и версию не ниже 7.3)
" Bundle 'sjl/gundo.vim'
	noremap <silent><Leader><Leader>g :GundoToggle<CR>



" Автоматическое выравнивание
" настройка tabular
" Bundle "godlygeek/tabular"
" позволяет автоматически растовлять пробелы и табы
" insert space, example:
" one	= 1
" two	= 2
" three = 3
" four	= 4
	" выравнивать по введенному символу
	noremap <Leader><Leader>t : Tabularize /
	" выравнивать за введенным символом
	noremap <Leader><Leader>tt : Tabularize /\zs



" Умное комментирование
" Bundle 'scrooloose/nerdcommenter'
" http://www.vim.org/scripts/script.php?script_id=1218
" все комбинации по умолчанию



" Менеджер буферов
" Bundle 'slack/vim-bufexplorer'
" стандартые вызовы
"  '\be' (normal open)
"  '\bs' (force horizontal split open)
"  '\bv' (force vertical split open)
" + мои по аналогии со всеми настройками через 2 Leader
	noremap <silent><Leader><Leader>b : BufExplorer<CR>
	noremap <silent><Leader><Leader>bs : BufExplorerHorizontalSplit<CR>
	noremap <silent><Leader><Leader>bv : BufExplorerVerticalSplit<CR>



" Быстрый набор html
" ZenCoding
" Bundle 'mattn/zencoding-vim'
"
let g:user_zen_settings = {
	\ 'php' : {
	\ 'extends' : 'html',
	\ 'filters' : 'c',
	\ },
	\ 'xml' : {
	\ 'extends' : 'html',
	\ },
	\}


" Плагин позволяет "всё" обрамлять в кавычки, теги и т.д.
"Bundle 'tpope/vim-surround'
"Normal mode
"-----------
"ds  - delete a surrounding
"cs  - change a surrounding
"ys  - add a surrounding
"yS  - add a surrounding and place the surrounded text on a new line + indent it
"yss - add a surrounding to the whole line
"ySs - add a surrounding to the whole line, place it on a new line + indent it
"ySS - same as ySs

"Visual mode
"-----------
"s   - in visual mode, add a surrounding
"S   - in visual mode, add a surrounding but place text on new line + indent it

"Insert mode
"-----------
"<CTRL-s> - in insert mode, add a surrounding
"<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
"<CTRL-g>s - same as <CTRL-s>
"<CTRL-g>S - same as <CTRL-s><CTRL-s>



" Удаление пробелов в конце строк всегда для всех файлов
" Bundle 'DeleteTrailingWhitespace'
	let g:DeleteTrailingWhitespace = 1




" При момощи этой штуки можно создать карту проекта
" Bundle 'project.tar.gz'
" чтобы открыть список проектов
	nmap <silent><Leader><Leader>p <Plug>ToggleProject
" \C - чтобы рекурсивно добавить в проект файлы



" Окно для просмотра тегов в файле
" Bundle 'taglist.vim'
	noremap <silent><leader><leader>t : TlistToggle<CR>




" Индексация тегов
" Bundle 'indexer.tar.gz'
let g:indexer_disableCtagsWarning=1
" настройка для php
autocmd FileType php let g:indexer_ctagsCommandLineOptions="-R --exclude=.svn --tag-relative=yes --PHP-kinds=+cfi-v --languages=php"


"
" Настройки плагинов для php
"


"	  Отладчик для php
"	  Bundle 'DBGp-Remote-Debugger-Interface'
"	  DBGp (xdebug)
"	  запустать так http://example.com/index.php?XDEBUG_SESSION_START=1
"	  требует php5-xdebug
"	  вызов F5
let g:debuggerPort = 9000
let g:debuggerTimeout = 10



"	  проверка синтаксиса php
"	  Bundle 'tomtom/checksyntax_vim'
"	  требует php-cli
"	  проверяет автоматически при попытке сохранить
"	  можно обучить и другим синтаксисам
noremap <silent><Leader><Leader>c :CheckSyntax<CR>


" стиль кодирования
" Bundle 'phpcodesniffer.vim'
" стандарт Zend
" требуется phpcs (http://pear.php.net/package/PHP_CodeSniffer)
" TODO: есть проблемы надо победить (не отображается код после проверки)
let g:php_check_codesniffer_cmd='phpcs --standard=Zend --report=emacs'
noremap <silent><Leader><Leader>cc :call PhpCodeSniffer()<CR>



" дополнение для функций и ключевых слов
" Bundle 'phpcomplete.vim'
" complete
"set ofu=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP




"
" Настройки плагинов для css/less
"


" TODO: сделать вызов less конвертора
" noremap



" сортировки css свойств
" Bundle 'miripiruni/CSScomb-for-Vim.git'
noremap <Leader><Leader>css :CSScomb<CR>




"---------------------------------------------------------------
"command	action
"---------------------- buffers ---------------------------------
":ls	show the buffer list
":bn	open the next buffer in the current window (cycles from the end of the list to the beginning).
":bp	open the previous buffer in the current window (cycles from the start of the list to the end).
"CTRL-^		switch to the alternate file
":w			save the changes to a file
":e!	restore the original file
":bd!	forcibly remove the buffer from the buffer list, discarding any changes
":q!	force Vim to quit, discarding changes to all modified buffers
"---------------------- windows ---------------------------------
"ctrl-w s	split the current window horizontally, loading the same file in the new window
"ctrl-w v	split the current window vertically, loading the same file in the new window
":sp[lit] filename	split the current window horizontally, loading filename in the new window
":vsp[lit] filename		split the current window vertically, loading filename in the new window
":q[uit]	close the currently active window
":on[ly]	close all windows except the currently active window
"ctrl-w w	cycle between the open windows
"ctrl-w h	focus the window to the left
"ctrl-w j	focus the window to the down
"ctrl-w k	focus the window to the up
"ctrl-w l	focus the window to the right
"ctrl-w +	increase height of current window by 1 line
"ctrl-w -	decrease height of current window by 1 line
"ctrl-w _	maximise height of current window
"ctrl-w |	maximise width of current window
"ctrl-w r	rotate all windows
"ctrl-w x	exchange current window with its neighbour
"ctrl-w H	move current window to far left
"ctrl-w J	move current window to bottom
"ctrl-w K	move current window to top
"ctrl-w L	move current window to far right
"---------------------- tabs ---------------------------------
":tabe[dit] filename	Open filename in a new tab
"ctrl-W T	Move current split window into its own tab
":q		Close window, closing tab if it contains a single window
":tabc[lose]	Close the current tab page and all its windows
":tabo[nly]		Close all tabs apart from the current one
"gt		Move to next tab
"gT		Move to previous tab
"#gt	Move to tab number #
":tabmove	Move current tab to the end
":tabmove 0		Move current tab to the beginning
":tabmove 1		Move current tab to become the 2nd tab
"---------------------- netrw (native filemanager) ---------------------------------
":e.	:edit .		at current working directory
":sp.	:split .	in split at current working directory
":vs.	:vsplit .	in vertical split at current working directory
":E		:Explore	at directory of current file
":Se	:Sexplore	in split at directory of current file
":Ve	:Vexplore	in vertical split at directory of current file
"%	create a new file
"d	create a new directory
"R	rename the file/directory under the cursor
"D	Delete the file/directory under the cursor
"---------------------- search and replace history ---------------------------------
"q/		Open the commandline window with history of searches
"q:		Open the commandline window with history of commands
"ctrl-f		Switch from commandline mode to the commandline window

" автодополнение вызывается по <c-x> дальше комбинация указывает где искать
" <c-x><c-n> - в текущем файле
" <c-x><c-i> - во всех буферах
" <c-x><c-]> - тегах
" <c-x><c-f> - именах файлов
" <c-x><c-o> - omni
" <c-x><c-u> - user
" <c-n> - среди ключевых слов (т.е. практически всего)
"
