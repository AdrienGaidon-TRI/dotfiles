" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible


" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" to update do:
" vim +BundleClean +BundleInstall! +qa

" Git integration
"Bundle 'motemen/git-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'airblade/vim-gitgutter'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
" XXX but problem with jedi?
Bundle 'klen/python-mode'
" Additional bundles
Bundle 'tell-k/vim-autopep8'
" Gvim colorscheme
Bundle 'Wombat'
" Yank history navigation
Bundle 'YankRing.vim'
" many colorschemes
Bundle 'flazz/vim-colorschemes'
" hybrid not found so list explicitly
Bundle 'w0ng/vim-hybrid'
" Better autocompletion
"Bundle 'Shougo/neocomplcache.vim'
Bundle 'Valloric/YouCompleteMe'
" simple latex plugin
Bundle 'lervag/vim-latex'
" 
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map tc :tabclose<CR>
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with ctrl+arrows
map <C-Right> <c-w>l
map <C-Left> <c-w>h
map <C-Up> <c-w>k
map <C-Down> <c-w>j
imap <C-Right> <ESC><c-w>l
imap <C-Left> <ESC><c-w>h
imap <C-Up> <ESC><c-w>k
imap <C-Down> <ESC><c-w>j

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" save as sudo
ca w!! w !sudo tee "%"

let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid
"colorscheme solarized


" colors for gvim
"if has('gui_running')
"    colorscheme wombat
"endif

" when scrolling, keep cursor 3 lines away from screen border
"set scrolloff=2

" autocompletion of files and commands behaves like shell
" first tab hit will complete as much as possible, the second tab hit will
" provide a list, the third and subsequent tabs will cycle through completion
" options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu

" Centralize backups, swapfiles and undo history
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
"if exists("&undodir")
"	set undodir=~/.vim/undo
"endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree ----------------------------- 

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$']

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" Syntastic ------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" show list of errors and warnings on the current file
"nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
""let g:syntastic_error_symbol = '✗'
""let g:syntastic_warning_symbol = '⚠'
""let g:syntastic_style_error_symbol = '✗'
""let g:syntastic_style_warning_symbol = '⚠'
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 5

" Python-mode ------------------------------

"" autpep8 stuff (cf. https://vim-autopep8.readthedocs.org/en/latest/)
autocmd FileType python map <buffer> ,8 :call Autopep8()<CR>

" don't use linter, we use syntastic for that
" don't show lint result every time we save a file
let g:pymode_lint_on_write = 1
" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
" use :PymodeLintAuto for autopep8
" navigate to next location in location list
nmap ,ln :lne<CR>
" rules to ignore (example: "E501,W293")
" E501: line length > 80, E731: use def instead of lambda, E265: '# '
let g:pymode_lint_ignore = "E501,E731,E265"
" don't add extra column for error icons (on console vim creates a 2-char-wide
" extra column)
let g:pymode_lint_signs = 1
" fold python code on open
let g:pymode_folding = 1
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" rope completion
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
" open definitions on same window, and with my custom mapping
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
" show doc for elem under cursor
let g:pymode_rope_show_doc_bind = ',h'
" nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
nmap ,D :split<CR>,d
nmap ,o :RopeFindOccurrences<CR>
" add paths to sys.path
" let g:pymode_paths = ["/local/home/gaidon/workspace/somelib", ]
" quickfix window
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
" pymode doc
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
" venv
let g:pymode_virtualenv = 0

" quit tip window when leaving insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" "

" Jedi
" let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#popup_select_first = 0
" disable docstring popup
" autocmd FileType python setlocal completeopt-=preview


" NeoComplCache ------------------------------
"
" " most of them not documented because I'm not sure how they work
" " (docs aren't good, had to do a lot of trial and error to make
" " it play nice)
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_ignore_case = 0
" let g:neocomplcache_enable_smart_case = 0
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_enable_fuzzy_completion = 1
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_fuzzy_completion_start_length = 1
" let g:neocomplcache_auto_completion_start_length = 1
" let g:neocomplcache_auto_completion_start_length = 1
" let g:neocomplcache_manual_completion_start_length = 1
" let g:neocomplcache_min_keyword_length = 1
" let g:neocomplcache_min_syntax_length = 1
" " complete with workds from any opened file
" let g:neocomplcache_same_filetype_lists = {}
" let g:neocomplcache_same_filetype_lists._ = '_'

" YoucompleteMe ------------------------------
"

" vim-latex
" deactivate buggy indent
let g:latex_indent_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My additions

"set guioptions-=m  " hides menu bar
set guioptions-=T  " hides toolbar

set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" automatically change window's cwd to file's dir
"set autochdir

" let g:NERDTreeDirArrows=0  " needed if LC_EXPORT_ALL is not en_US.UTF-8

"" Raccourci pour naviger entre les buffers
" passe au buffer suivant en mode normal
nmap <silent> <tab> :bn<CR>
nmap <silent> <C-tab> :b#<CR>
" delete le buffer courant et passe au buffer precedent
nmap <silent> <S-tab> :bd<CR>

" manipulate system register
noremap <silent> <C-x> "+x
noremap <silent> <C-c> "+y
noremap <silent> <S-Insert> "+gP
imap <silent> <S-Insert> <MiddleMouse>

" call make
nmap <leader>m :!make<CR><CR>

" vim-latex opts
nmap ll :VimLatexCompile<CR>
let g:latex_indent_enabled = 0
let g:latex_latexmk_background = 1
let g:latex_latexmk_continuous = 1
let g:latex_toc_enabled = 1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis

" command to autopep8 the file you're in
" command Pep8 :!autopep8 --in-place %:p

" backup directory where the '*~' files generated by vim are stored
"set backupdir=~/.vim_backups

" autom. search for 'tags' files in the file tree: might slow down a lot
set tags=./tags,~/workspace/tags

"let mapleader = ","

set modeline

"set foldmethod=syntax
"set foldmethod=indent

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'

let tlist_pyrex_settings='python;c:classe;m:memder;f:function'
