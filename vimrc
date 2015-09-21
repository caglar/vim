" Hotkeys summary (note <leader> == ",")
" ----------------
" <leader> g            Rope goto definition (jedi through rope)
" <Ctrl>-o              Jump back
" <K>                   Show documentation with jedi plugin

" Ctrl-l                Creates documentation of highlighted 'def' or 'class'
" def + <Tab>           Create snippet for new function
" ipdb + <Tab>          Sets trace
" <leader> ig           Toggle visualization of indent guides

" <Ctrl-Space>          Rope autocomplete (jedi through rope)

" <leader> tl           opens TaskList (shows every todo)
" <F5>                  Gundo popup (diff with last saves)
" <leader> r            Rename all occurrencies
" [[                    Jump on previous class or function (normal, visual, operator modes) (jedi through rope)
" ]]                    Jump on next class or function (normal, visual, operator modes)  (jedi through rope)
" [M                    Jump on previous class or method (normal, visual, operator modes) (jedi through rope)
" ]M                    Jump on next class or method (normal, visual, operator modes) (jedi through rope)


" Plugins description
" -------------------
"  * gundo: diff with last saves
"  * jedi-vim: does everything :)
"  * pydocstring: inserts templates for the documentation
"  * snipmate: allows to insert snippets with <snippet_name> + <Tab>
"  * snippets: snipmate custom snippets directory
"  * supertab: provides autocomplete with TAB
"  * syntastic: syntax check in vim (a syntax checker has to be installed) 
"  * tasklist: lists of every todo in the code
"  * vim-indent-guides: adds indentation guides
"  * vim-yaml: indentation settings for yaml files

" Disabled
"  * pydoc: shows the documentation of the current command

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle + plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " you can also pass a path where Vundle should install plugins

" The installed bundles 
" To modify: add or remove, close .vimrc, open any file with vim and run :PluginInstall
" see :h vundle for more details or wiki for FAQ
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle (required!)  
Plugin 'sjl/gundo.vim', {'name': 'gundo'}
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/TaskList.vim', {'name': 'tasklist'}
Plugin 'heavenshell/vim-pydocstring', {'name': 'pydocstring'}
Plugin 'tomtom/tlib_vim'  " (snipmate requirement)
Plugin 'MarcWeber/vim-addon-mw-utils'  " (snipmate requirement)
Plugin 'garbas/vim-snipmate', {'name': 'snipmate'}
Plugin 'honza/vim-snippets', {'name': 'snippets'}
Plugin 'avakhov/vim-yaml'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wincent/Command-T'

" Plugin 'fs111/pydoc.vim', {'name': 'pydoc'}
" Plugin 'klen/python-mode'  " Apparently not compatible with jedi-vim

" TODO: C++ 
" http://www.zwiener.org/vimautocomplete.html

call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu

nmap <leader>sb :call SplitScroll()<CR>


"<CR><C-w>l<C-f>:set scrollbind<CR>

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>

" Run command-t file search
map <leader>f :CommandT<CR>
" Ack searching
nmap <leader>a <Esc>:Ack!

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>


filetype plugin indent on " Turn on filetype-specific indenting modes and plugins
filetype on

" enable pathogen 
" execute pathogen#infect()

set autoindent " Enable autoindent
syntax on " Enable syntax highlighting
syntax enable

" set omnifunc=syntaxcomplete#Complete  " Enable omnicompletion for programming syntax (Ctrl+X-Ctrl+O brings menu up)

set infercase
set completeopt=longest,menuone

autocmd BufWritePre *.py,*.pyx :%s/\s\+$//e

" Enable the flake8 -- Warning: This slow down the code a lot.
" autocmd BufWritePost *.py call Flake8()

" Only do all this once for each buffer.
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal tabstop=4 " Tab width for 'hard tabs' (tab characters)
setlocal softtabstop=4 " Tab width for 'soft tabs' (with expandtab)
setlocal shiftwidth=4 " Shift commands < > take you 4 spaces
setlocal expandtab  " Tab inserts spaces instead

" Make text wrap at just under 80 characters.
setlocal textwidth=79

" Smart tabbing/indenting -- see the help, you might like these or might not.
setlocal smarttab
setlocal smartindent

let python_highlight_all=1

set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>


set bg=light
syntax on
set ruler
set number
set smarttab
set fileformats=unix,dos,mac " support all three, in this order
set formatoptions=tcqor " t=text, c=comments, q=format with "gq", o,r=autoinsert comment leader
set cindent                             " indent on cinwords
set showmatch                   " Show matching brackets/braces/parantheses.
set background=dark     " set background to dark
set showcmd                             " Show (partial) command in status line.
set autowrite                   " Automatically save before commands like :next and :make
set textwidth=98                " My terminal is 98 characters wide
set visualbell                          " Silence the bell, use a flash instead
set cinoptions=:.5s,>1s,p0,t0,(0,g2     " :.5s = indent case statements 1/2 shiftwidth
set cinwords=if,else,while,do,for,switch,case,class,try   " Which keywords should indent
set showmatch
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] "Shows detailed status line with formatting
set laststatus=2 "This Makes the status bar visible
set mat=5
filetype plugin on
filetype indent on

set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
"set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

set colorcolumn=82
hi CursorLine term=bold cterm=bold guibg=Grey40

"""" Display
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="low"
set background=dark
colorscheme solarized

" Some flake8 configurations:
let g:flake8_ignore="E501,W293"
let g:flake8_max_line_length=99

" Enable git airline fonts
let g:airline_powerline_fonts = 1

set spell
setlocal spell spelllang=en_us
let g:tex_comment_nospell=1

let g:tex_conceal = ""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation and tab settings
set autoindent " New line inherits indentation from the previous line
set nosmartindent " Avoid losing indentation when inserting '#'
set cindent " Should be smarter than smartindent. Autoindents after brackets, ..
set tabstop=4 " 1 Tab = 4 spaces
set shiftwidth=4 " 1 Tab = 4 spaces
set expandtab " Substitute tabs with spaces
set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines
" set list " show tabs
" set listchars=tab:\|\<Space> " how to highlight tabs
" set number " Show line numbers
" set smarttab
" set lbr " Set line break
" set tw=500 " Set line break at 500 characters


" Generic stuff
set history=700 " Sets how many lines of history VIM has to remember
set autoread " Set to auto read when a file is changed from the outside
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu " Turn on the WiLd menu (autocomplete :commands)
set ruler " Always show current position
set cmdheight=1 " Height of the command bar
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l " idem
set lazyredraw " Don't redraw while executing macros (good performance config)
set showmatch " Show matching brackets
set mat=2 " How many tenths of a second to blink when matching brackets
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
" set hid " A buffer becomes hidden when it is abandoned
" set magic " For regular expressions turn magic on

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Files, backups and undo
set nobackup 
set nowb
set noswapfile

" Move between windows with alt+arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Syntax highlight and colors
syntax on " Enable syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Turn on filetype-specific indenting modes and plugins
let python_highlight_all=1 " Extra highlights
set tm=500

" Colors --> not working well, it's a mess.
"set t_Co=256 " Force VIM to use 256 colors even if terminal doesn't
"colo fra  " use my color scheme
"if exists('+colorcolumn') " Draw a yellow column after 80 lines and after 120 
"    let &colorcolumn="80,".join(range(120,999),",") 
"    hi ColorColumn ctermfg=yellow ctermbg=232 guibg=#2c2d27
"endif
" Error and warning highlight colors 
"hi Search ctermfg=237 ctermbg=178 " Colors for search

" Search options
set hlsearch " Highlight results of search
set incsearch " Makes search act like search in modern browsers
set ignorecase " Do case insensitive matching
set smartcase " Search case sensitive only if you type uppercase

" Strip trailing whitespace off all lines every time you save a .py or .pyx file
autocmd BufWritePre *.py,*.pyx :%s/\s\+$//e

" Jump to the last position when reopening a file (NB: .viminfo should be owned by your user)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Vim scrolling (!!!) - NOTE: to select text with mouse keep shift pressed
set mouse=a
"set ttymouse=xterm

" Add the virtualenv's site-packages to vim path to have the code completion
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    #activate_this = os.path.join(project_base_dir,
    #'bin/activate_this.py')
    #execfile(activate_this, dict(__file__=activate_this))
EOF

" Map jj to <Esc>
imap jj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gundo (navigate through undo list)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi-vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (refer to https://github.com/davidhalter/jedi-vim#faq)
let g:jedi#popup_on_dot = 0 "do not trigger autocomplete on dot
let g:jedi#show_call_signatures = 2 "popup with arguments of the current function 
"let g:jedi#popup_select_first = 0 "automatically select the first entry
let g:jedi#auto_close_doc = 1  "automatically close doc window
"let g:jedi#documentation_command = 'K'
let g:jedi#max_doc_height=20  "height of the doc window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pydoc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open docs with <leader>pw or <leader>pW
filetype plugin on
let g:pydoc_highlight = 0 " Don't highlight word when open word definition 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pydocstring 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydocstring_templates_dir = $HOME."/.vim/bundle/pydocstring-templates/"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType python set omnifunc=pythoncomplete#Complete " This breaks Jedi
let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview  # kyle
let g:SuperTabDefaultCompletionType = "<c-x><c-o>" " always use omni completion (i.e. Jedi)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (Syntax check)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers = ['flake8'] "use one of the following checkers: 
                                             " flake8, pyflakes, pylint, python (native checker)
let g:syntastic_enable_highlighting = 1  "highlight errors and warnings
let g:syntastic_style_error_symbol = ">>" "error symbol
let g:syntastic_warning_symbol = ">>" "warning symbol
"let g:syntastic_auto_loc_list=1  "open list of errors
let g:syntastic_loc_list_height = 5  "list length
let g:syntastic_auto_jump = 0  "do not jump to errors when detected
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'  "show number of errors and warnings
"set the colour of errors and warnings 
"hi SpellBad ctermfg=237  ctermbg=178
"hi error ctermfg=237 ctermbg=178                       " errors sign
"hi SyntasticErrorSign ctermfg=237 ctermbg=178          " style errors sign
hi SpellBad ctermfg=darkblue ctermbg=yellow             " errors line
hi error ctermfg=darkblue ctermbg=yellow                " errors sign
hi SyntasticErrorSign ctermfg=darkblue ctermbg=yellow   " style errors sign

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tasklist 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map <leader>tl <Plug>TaskList

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim indent guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggled with <Leader> ig
let g:indent_guides_auto_colors = 0 " set colors manually
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level=2 " start showing indentation from the 2 level
let g:indent_guides_guide_size=1 " dimension of the guide
let g:indent_guides_enable_on_vim_startup=0 "autostart














" DISABLED



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
"let g:pymode_doc = 0
" set completeopt=menu " Prevent the docs window from automatically open

"Linting
"let g:pymode_lint = 0  " Disable linting: use syntastic
""let g:pymode_lint_checker = "pyflakes,pep8,pep257"
""let g:pymode_lint_write = 1 " Auto check on save (if modified)
""let g:pymode_lint_unmodified = 0 " Check even if unmodified
""let g:pymode_lint_signs = 1 " Place error signs
""let g:pymode_lint_ignore = "C901"
""let g:pymode_lint_cwindow = 1 "Auto open cwindow (quickfix) if any errors have been found
"
"" Automatically fix PEP8 errors in the current buffer:
"noremap <F8> :PymodeLintAuto<CR>
"
"" Support virtualenv detection
"let g:pymode_virtualenv = 1
"
"" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = '<leader>b'
"let g:pymode_breakpoint_cmd = 'from IPython import embed; embed()'
"
"" Completion
"let g:pymode_rope_completion = 1 " Turn on code completion
"let g:pymode_rope_complete_on_dot = 0 " Turn off autocomplete on dot
"let g:pymode_rope_completion_bind = '<C-Space>' " Ctrl-space to complete
"let g:pymode_rope_autoimport = 1 " Autocomplete objects that have not been imported
"
"" Syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
"" Don't autofold code
"let g:pymode_folding = 0
"
"" Disable rope (refactoring)
"let g:pymode_rope = 0 
                                                                                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ropevim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to definition and rename all occurrencies
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Ulti-snips 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<Tab>"
""let g:UltiSnipsJumpForwardTrigger="<c-b>"
""let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remap ycm keys to iterate over list, as by default are mapped to tab and
"" s-tab, which breaks ultisnips
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
"let g:ycm_autoclose_preview_window_after_completion=1
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
