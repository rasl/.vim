""" ## Ещё одна конфигурация vim
"""
""" * [ Краткое описание ](#intro)
""" * [ Установка ](#install)
""" * [ Список горячих клавиш ](#shortcuts)
""" * [ Ёще описание ](#desc)
""" * [ Плагины ](#plugins)
""" * [ Шпаргалка ](#shortList)
"""
set nocompatible " без обратной совместимоси с vi

""" ### Краткое описание <a id="intro" />
"""
""" В репозитории нет самих плагинов, они подключаются через [ vudle ](https://github.com/gmarik/vundle)
""" Для работы необходим git.
""" Все горячие клавиши начинаются с двойного нажания <code>leader</code>.
""" Эти настройки использую под debian и cygwin, т.е. в linux-like должно работать.
"""


""" ### Установка <a id="install" />
"""
""" <code>
""" $ git clone https://rasl@github.com/rasl/.vim.git ~/.vim
""" $ cd ~/.vim
""" $ . install.sh
""" </code>
"""
""" Установит vundle и через него поддтянет плагины, сделает symlink'и.
""" Если устанавливать не в ~/.vim, сделает копию предыдущих настроек
""" (~/.vim.backup ~/.vimrc.backup)
"""


""" ### Список горячих клавиш <a id="shortcuts" />
""" :shortcutList:
"""

"""
""" ### Ёще описание <a id="desc" />
"""
" Подключение и запуск vundle
" нужен git
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

"
" Все мое протраснство пользовательских функций начинается с <Leader><Leader>
" по умолчанию <Leader> равен нажатию \
"
	let mapleader="\\" " пусть так и остается

"
"	syntax
"
filetype on					  " required system plugins (hightlight for many system files)
filetype plugin indent on	  " required special plugins

""" Можно передвигаться с помощью hjkl в Insert mode зажав Ctrl
		imap <C-h> <C-o>h
		imap <C-j> <C-o>j
		imap <C-k> <C-o>k
		imap <C-l> <C-o>l


" Отключить звуковой сигнал
        set visualbell " Use visual bell instead of beeping
        set t_vb=


"""
""" Стрелки и pgUp pgDown отключены
"""
	inoremap   <Up>      <NOP>
	noremap    <Up>      <NOP>
	inoremap   <Down>    <NOP>
	noremap    <Down>    <NOP>
	inoremap   <Left>    <NOP>
	noremap    <Left>    <NOP>
	inoremap   <Right>   <NOP>
	noremap    <Right>   <NOP>
	inoremap   <PageUp>   <NOP>
	noremap    <PageUp>   <NOP>
	inoremap   <PageDown>   <NOP>
	noremap    <PageDown>   <NOP>

"
" Настройки интерфейса через нативные возможности
"

" номера строк
	set nonumber " не показывать номера строк
	let g:relativenumber = 0
	" включение/выключение
	function! ToggleRelativeNumber()
		if g:relativenumber == 0
			let g:relativenumber = 1
			set norelativenumber
			set number
		elseif g:relativenumber == 1
			let g:relativenumber = 2
			set nonumber
			set relativenumber
		else
			let g:relativenumber = 0
			set nonumber
			set norelativenumber
		endif
	endfunction
""" :shortcut: <leader><leader>n - вкл/выкл нумерацию строк (3 режима)
	nnoremap <silent> <leader><leader>n :call ToggleRelativeNumber()<CR>


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
""" :shortcut: <leader><leader>e - конвертация табов в пробелы и обратно
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
""" :shortcut: <leader><leader>w - вкл/выкл перенос строк
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
""" :shortcut: <leader><leader>l - показывать/не показывать непечатаемые символы (пробебы, табы и т.д.)
	nnoremap <silent> <leader><leader>l :call ToggleList()<CR>


" подсветка строки, в которой находится курсор
	set cursorline

" количество цветов
	set t_Co=256


" status line
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
""" :shortcut: <leader><leader>s - вкл/выкл проверку правописания
		nnoremap <silent> <leader><leader>s :call ToggleSpell()<CR>
		" только английский
""" :shortcut: <leader><leader>se - вкл/выкл проверку английского
		nnoremap <silent> <leader><leader>se :call OnSpellEn()<CR>
		" только русский с (учетом буквы ё)
""" :shortcut: <leader><leader>sr - вкл/выкл проверку русского
		nnoremap <silent> <leader><leader>sr :call OnSpellRu()<CR>
		" проверка сразу 2х языков
""" :shortcut: <leader><leader>sre - вкл/выкл проверку правописания сразу 2х
""" :shortcut: <leader><leader>sre - вкл/выкл проверку правописания сразу 2х
		nnoremap <silent> <leader><leader>ser :call OnSpellRuEn()<CR>
		nnoremap <silent> <leader><leader>sre :call OnSpellRuEn()<CR>
	endif


" работа с конфигом самого vim
	" открыть конфиг в новом tab
""" :shortcut: <leader><leader>v - открыть конфиг .vimrc в новом tab
	nnoremap <silent><leader><leader>v :tabedit $MYVIMRC<CR>
	" подкгузка новых изменений
""" :shortcut: <leader><leader>vv - применить изменения конфига .vimrc
	nnoremap <silent><leader><leader>vv :source $MYVIMRC<CR>
	" автоподгрузка изменение (бывает сильно тупит)
	"if has("autocmd")
		"autocmd bufwritepost .vimrc source $MYVIMRC
	"endif
	" Создание markdown из комментариев сомого конфига .vimrc
	function! MakeMarkDownFromComment()
		let mapleader = g:mapleader
		let shortkeys=[]
		let file = readfile($MYVIMRC)
		for line in file
			if !empty(matchstr(line, "\"\\{3}\\s:shortcut:.*"))
				let shortkey = substitute(line, "\"\\{3}\\s:shortcut:\\s\\(.*\\)", "\\1", "g")
				let shortkey = substitute(shortkey, "\\(\\(<leader>\\)\\+[^ ]\\+\\)", "<code>\\1</code>", "g")
				let shortkey = substitute(shortkey, "<leader>", substitute(mapleader, "\\", '\\\\\\\\', "g"), "g")
				call add(shortkeys, shortkey)
			endif
		endfor
		let outfile=[]
		let file = readfile($MYVIMRC)
		for line in file
			let line = matchstr(line, "\"\\{3}.*")
			if !empty(line)
				let line = substitute(line, "\"\\{3}", "", "g")
				let line = substitute(line, "^\\s\\+", "", "g")
				if !empty(matchstr(line, ":shortcutList:.*"))
					let line=''
					for shortkey in shortkeys
						call add(outfile, " ".shortkey)
					endfor
				endif
				if empty(matchstr(line, ":shortcut:.*"))
					call add(outfile, line)
				endif
			endif
		endfor
		call writefile(outfile, $HOME.'/.vim/README.mkd')
	endfunction
""" :shortcut: <leader><leader>vd - сгенерировать readme.mk из комментариев в .vimrc
	noremap <silent><leader><leader>vd : call MakeMarkDownFromComment()<CR>


" история команд vim
	 set history=1000 " хранить поледнюю тысячу команд


" Поиск
	set incsearch " При поиске перескакивать на найденный текст в процессе набора строки
	set hlsearch " Включаем подсветку выражения, которое ищется в тексте
	set ignorecase " Игнорировать регистр букв при поиске
	set smartcase " не игнорировать регистр если есть большие буквы
	" после поиска остается подсветка найденых слов, что очень мешает
	" чтобы убрать:
""" :shortcut: <leader><esc> - убрать подсветку поиска
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
""" :shortcut: <leader><leader>r - поиск и замена во всех открытых буферах
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
""" :shortcut: <leader><leader>m - вкл/выкл меню в gvim
	noremap <silent><leader><Leader>m :call ToggleGUINoise()<cr>




"""
""" ### Плагины <a id="plugins" />
"""

""" #### Bundle 'Color-Sampler-Pack'
""" Цветовые схемы
""" пакет стандартных цветовых схем
""" для работы нужны 256 цветов
""" set t_Co=256
"""
	" темная
""" :shortcut: <leader><leader>t5 - применить цветовую схему railscasts (темная)
	nmap <silent><Leader><Leader>t5 :colorscheme railscasts<CR>
	" темная
""" :shortcut: <leader><leader>t5 - применить цветовую схему wombat256 (темная)
	nmap <silent><Leader><Leader>t4 :colorscheme wombat256<CR>
	" светлая
""" :shortcut: <leader><leader>t5 - применить цветовую схему autumn2 (светлая)
	nmap <silent><Leader><Leader>t3 :colorscheme autumn2<CR>
	" прозрачная котрастная
""" :shortcut: <leader><leader>t5 - применить цветовую схему peachpuff (контрастрая)
	nmap <silent><Leader><Leader>t2 :colorscheme peachpuff<CR>
	" прозрачная не контрастная
""" :shortcut: <leader><leader>t5 - применить цветовую схему neon (не контрастная)
	nmap <silent><Leader><Leader>t1 :colorscheme neon<CR>
	" set default
	colorscheme neon



""" #### Bundle 'sjl/gundo.vim'
""" Древовидный вид истории изменений
""" (очень крутая штука, требует python и версию не ниже 7.3)
"""
""" :shortcut: <leader><leader>g - gundo (древовидный вид истории изменений)
	noremap <silent><Leader><Leader>g :GundoToggle<CR>



""" #### Bundle "godlygeek/tabular"
""" Автоматическое выравнивание
""" настройка tabular
""" позволяет автоматически растовлять пробелы и табы
""" insert space, example:
""" one	= 1
""" two	= 2
""" three = 3
""" four	= 4
"""
	" выравнивать по введенному символу
""" :shortcut: <leader><leader>t - tabular : Tabularize /
	noremap <Leader><Leader>t : Tabularize /
	" выравнивать за введенным символом
""" :shortcut: <leader><leader>tt - tabular : Tabularize /\zs
	noremap <Leader><Leader>tt : Tabularize /\zs



""" #### Bundle 'scrooloose/nerdcommenter'
""" Умное комментирование
""" http://www.vim.org/scripts/script.php?script_id=1218
""" все комбинации по умолчанию
"""



""" #### Bundle 'slack/vim-bufexplorer'
""" Менеджер буферов
""" стандартые вызовы
"""  '\be' (normal open)
"""  '\bs' (force horizontal split open)
"""  '\bv' (force vertical split open)
""" + мои по аналогии со всеми настройками через 2 Leader
"""
""" :shortcut: <leader><leader>b - bufexporer (менеджер буферов)
	noremap <silent><Leader><Leader>b : BufExplorer<CR>



""" #### Bundle 'mattn/zencoding-vim'
""" ZenCoding
""" Быстрый набор html
"""
let g:user_zen_settings = {
	\ 'php' : {
	\ 'extends' : 'html',
	\ 'filters' : 'c',
	\ },
	\ 'xml' : {
	\ 'extends' : 'html',
	\ },
	\}


""" #### Bundle 'tpope/vim-surround'
""" Плагин позволяет "всё" обрамлять в кавычки, теги и т.д.
"""



""" #### Bundle 'DeleteTrailingWhitespace'
""" Удаление пробелов в конце строк всегда для всех файлов
"""
	let g:DeleteTrailingWhitespace = 1




""" #### Bundle 'project.tar.gz'
""" При момощи этой штуки можно создать карту проекта
""" чтобы открыть список проектов
""" \C - чтобы рекурсивно добавить в проект файлы
"""
""" :shortcut: <leader><leader>p - project (менеджер проектов)
	nmap <silent><Leader><Leader>p <Plug>ToggleProject



""" #### Bundle 'taglist.vim'
""" Окно для просмотра тегов в файле
"""
""" :shortcut: <leader><leader>t - taglist (менеджер тегов)
	noremap <silent><leader><leader>t : TlistToggle<CR>




""" #### Bundle 'indexer.tar.gz'
""" Индексация тегов
"""
let g:indexer_disableCtagsWarning=1
" настройка для php
autocmd FileType php let g:indexer_ctagsCommandLineOptions="-R --exclude=.svn --tag-relative=yes --PHP-kinds=+cfi-v --languages=php"


"
" Настройки плагинов для php
"


""" #### Bundle 'DBGp-Remote-Debugger-Interface'
""" Отладчик для php
""" DBGp (xdebug)
""" запустать так http://example.com/index.php?XDEBUG_SESSION_START=1
""" требует php5-xdebug
""" вызов F5
"""
let g:debuggerPort = 9000
let g:debuggerTimeout = 10



""" #### Bundle 'tomtom/checksyntax_vim'
""" проверка синтаксиса php
""" требует php-cli
""" проверяет автоматически при попытке сохранить
""" можно обучить и другим синтаксисам
"""
""" :shortcut: <leader><leader>c - checksyntax php (вызов php-cli для проверки php синтаксиса)
noremap <silent><Leader><Leader>c :CheckSyntax<CR>


""" #### Bundle 'phpcodesniffer.vim'
""" стиль кодирования
""" стандарт Zend
""" требуется phpcs (http://pear.php.net/package/PHP_CodeSniffer)
""" TODO: есть проблемы надо победить (не отображается код после проверки)
"""
""" :shortcut: <leader><leader>cc - phpcodesniffer (проверка стиля кодирования)
let g:php_check_codesniffer_cmd='phpcs --standard=Zend --report=emacs'
noremap <silent><Leader><Leader>cc :call PhpCodeSniffer()<CR>



""" #### Bundle 'phpcomplete.vim'
""" дополнение для функций и ключевых слов
""" complete
"""
"set ofu=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP




"
" Настройки плагинов для css/less
"


" TODO: сделать вызов less конвертора
" noremap



""" #### Bundle 'miripiruni/CSScomb-for-Vim.git'
""" сортировка css свойств
"""
""" :shortcut: <leader><leader>css - CSScomb (сортировка css свойств)
noremap <Leader><Leader>css :CSScomb<CR>




"""
""" ### Шпаргалка <a id="shortList" />
"""
""" #### Буферы
"""
""" <pre>
""" :ls    	 show the buffer list
""" :bn    	 open the next buffer in the current window (cycles
"""					from the end of the list to the beginning).
""" :bp    	 open the previous buffer in the current window (cycles
"""					from the start of the list to the end).
""" CTRL-^ 	 switch to the alternate file
""" :w     	 save the changes to a file
""" :e!    	 restore the original file
""" :bd!   	 forcibly remove the buffer from the buffer list, discarding any changes
""" :q!    	 force Vim to quit, discarding changes to all modified buffers
""" </pre>
"""
""" #### Окна
"""
""" <pre>
""" ctrl-w s           	 split the current window horizontally,
"""							loading the same file in the new window
""" ctrl-w v           	 split the current window vertically,
"""							loading the same file in the new window
""" :sp[lit] filename  	 split the current window horizontally,
"""							loading filename in the new window
""" :vsp[lit] filename 	 split the current window vertically,
"""							loading filename in the new window
""" :q[uit]            	 close the currently active window
""" :on[ly]            	 close all windows except the currently active window
""" ctrl-w w           	 cycle between the open windows
""" ctrl-w h           	 focus the window to the left
""" ctrl-w j           	 focus the window to the down
""" ctrl-w k           	 focus the window to the up
""" ctrl-w l           	 focus the window to the right
""" ctrl-w +           	 increase height of current window by 1 line
""" ctrl-w -           	 decrease height of current window by 1 line
""" ctrl-w _           	 maximise height of current window
""" ctrl-w |           	 maximise width of current window
""" ctrl-w r           	 rotate all windows
""" ctrl-w x           	 exchange current window with its neighbour
""" ctrl-w H           	 move current window to far left
""" ctrl-w J           	 move current window to bottom
""" ctrl-w K           	 move current window to top
""" ctrl-w L           	 move current window to far right
""" </pre>
"""
""" #### Табы
"""
""" <pre>
""" :tabe[dit] filename 	 Open filename in a new tab
""" ctrl-W T            	 Move current split window into its own tab
""" :q                  	 Close window, closing tab if
"""								it contains a single window
""" :tabc[lose]         	 Close the current tab page and all its windows
""" :tabo[nly]          	 Close all tabs apart from the current one
""" gt                  	 Move to next tab
""" gT                  	 Move to previous tab
""" #gt                 	 Move to tab number #
""" :tabmove            	 Move current tab to the end
""" :tabmove 0          	 Move current tab to the beginning
""" :tabmove 1          	 Move current tab to become the 2nd tab
""" </pre>
"""
""" #### netrw (файловый менеджер)
"""
""" </pre>
""" :e.  	 :edit .      	 at current working directory
""" :sp. 	 :split .     	 in split at current working directory
""" :vs. 	 :vsplit .    	 in vertical split at current working directory
""" :E   	 :Explore     	 at directory of current file
""" :Se  	 :Sexplore    	 in split at directory of current file
""" :Ve  	 :Vexplore    	 in vertical split at directory of current file
""" %    	 create a new file
""" d    	 create a new directory
""" R    	 rename the file/directory under the cursor
""" D    	 Delete the file/directory under the cursor
""" </pre>
"""
""" #### Поиск и замена
"""
""" <pre>
""" q/     	 Open the commandline window with history of searches
""" q:     	 Open the commandline window with history of commands
""" ctrl-f 	 Switch from commandline mode to the commandline window
""" </pre>
"""
""" #### Автодополнения
"""  автодополнение вызывается по ctrl-x дальше комбинация указывает где искать
"""
""" <pre>
"""  ctrl-x ctrl-n 	 в текущем файле
"""  ctrl-x ctrl-i 	 во всех буферах
"""  ctrl-x ctrl-] 	 тегах
"""  ctrl-x ctrl-f 	 именах файлов
"""  ctrl-x ctrl-o 	 omni
"""  ctrl-x ctrl-u 	 user
"""  ctrl-n        	 среди ключевых слов (т.е. практически всего)
""" </pre>
"""
""" #### surround
""" В разных режимах работает по разному
""" <pre>
""" Normal mode
""" ds  	 delete a surrounding
""" cs  	 change a surrounding
""" ys  	 add a surrounding
""" yS  	 add a surrounding and place the surrounded text on a new line + indent it
""" yss 	 add a surrounding to the whole line
""" ySs 	 add a surrounding to the whole line, place it on a new line + indent it
""" ySS 	 same as ySs
""" Visual mode
""" s  	in visual mode, add a surrounding
""" S  	in visual mode, add a surrounding but place text on new line + indent it
""" Insert mode
""" CTRL-s        	 in insert mode, add a surrounding
""" CTRL-s CTRL-s 	 in insert mode, add a new line + surrounding + indent
""" CTRL-g s      	 same as <CTRL-s>
""" CTRL-g S      	 same as <CTRL-s><CTRL-s>
""" </pre>
"""
