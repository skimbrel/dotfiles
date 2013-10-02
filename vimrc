function! ImportList(name)
    let filename=expand("%")

    " Build the command to execute
    let cmd="pyflakes "
    let cmd.=filename
    let cmd.=" | sed -n \"/undefined name/s/.*: undefined name '\\(.*\\)'/from "
    let cmd.=a:name
    let cmd.=" import \\1/p\" | sort | uniq"

    put=system(cmd)
endfunction
command! -nargs=1 ImportList :call ImportList("<args>")

" Load modules with Pathogen.
call pathogen#infect()

" Set Solarized color scheme.
syntax on
set background=dark
set t_Co=256
colorscheme solarized

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window for multiple buffers, and/or:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options
"
" Indentation settings according to personal preference.

" if some codebase wants tabs:
if has('autocmd')
    autocmd BufEnter *.java setlocal noexpandtab
    autocmd BufEnter *.java setlocal shiftwidth=8   " autoindent
    autocmd BufEnter *.java setlocal tabstop=8      " width of existing physical tabs
    autocmd BufEnter *.java setlocal softtabstop=8  " distance Tab key moves
    " twilio php wants tabs
    autocmd BufEnter *twilio*/php*.php setlocal noexpandtab
    autocmd BufEnter *twilio*/php*.php setlocal shiftwidth=8
    autocmd BufEnter *twilio*/php*.php setlocal tabstop=8
    autocmd BufEnter *twilio*/php*.php setlocal softtabstop=8
endif

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-O> to turn off search highlighting until the
" next search
nnoremap <C-O> :nohl<CR>

" Load ctags.
set tags=./tags;/

" Omni Completion
"autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

" Disable autoinclude for faster tab complete.
set complete-=i

" automatically figure out if we want Tab or complete
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

" highlight the evil spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" A couple fun Python tricks.
let @t='ceTrue'
let @f='ceFalse'
nmap <leader>T @t
nmap <leader>F @f

let @d='Oimport ipdb; ipdb.set_trace()'
nmap <leader>d @d

" ctrl+p settings
let g:ctrlp_working_path_mode = 2

" Easier jumping around in splits
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

" Tab tweaks
set showtabline=2
nnoremap <leader>l :tabn<CR>
nnoremap <leader>h :tabp<CR>

" Quit all the things more easily
nnoremap :Q :qa
nnoremap :Q! :qa!

" pymode tweaks
" SQLAlchemy makes us use == None, == True, == False so ignore PEP8 E711,712
let g:pymode_lint_ignore = "E711,E712"
let g:pymode_rope = 1
let g:pymode_rope_autocomplete_map = "<C-Space>"
let g:pymode_rope_auto_project = 1
let g:pymode_rope_goto_def_newwin = ":tabe"


" twilio test runner
function! RunTestsInFile()
    if(&ft=='php')
      :execute "!" . "/usr/local/bin/phpunit " . bufname('%')
    elseif(&ft=='go')
      exec ":!gp test"
    elseif(&ft=='javascript')
      exec ":!jasmine-node " . bufname('%')
    elseif(&ft=='python')
      exec ":!" . ". venv/bin/activate; nosetests " . bufname('%')  . " --stop"
    endif
endfunction


" more shortcut goodness
nmap <leader>L :PyLint<CR>
nmap <leader>a :Ack
nmap <leader>A :AckAdd
nmap <leader>b :Gblame<CR>
nmap <leader>r :call RunTestsInFile()<CR>

" Dump things into OS X paste buffer
vmap <leader>c :w !pbcopy<CR><CR>
nnoremap <leader>c :.w !pbcopy .<CR><CR>



" Quick toggle for relative numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>n :call NumberToggle()<cr>

" enable them by default
set relativenumber

" load command-t help fns
:call pathogen#helptags()

" Pretty format XML, for writing docs and shit
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
