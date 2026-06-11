" " " " " " " " " " " " " " " " " " " " " " "
"               _                         
"      __   __ (_)  _ __ ___    _ __    ___ 
"      \ \ / / | | | '_ ` _ \  | '__|  / __|
"   _   \ V /  | | | | | | | | | |    | (__ 
"  (_)   \_/   |_| |_| |_| |_| |_|     \___|
"                                         
" " " " " " " " " " " " " " " " " " " " " " "

let g:plug_path=expand('~/.vim/autoload/plug.vim')

if !filereadable(g:plug_path)

    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

call plug#begin()


Plug 'catppuccin/vim', { 'as': 'catppuccin' }

let g:catppuccin_path=expand('~/.vim/plugged/catppuccin')


Plug 'morhertz/gruvbox', { 'as': 'gruvbox' }

let g:gruvbox_path=expand('~/.vim/plugged/gruvbox')


Plug 'lambdalisue/vim-fern', { 'as': 'fern' }

let g:fern_path=expand('~/.vim/plugged/fern')


Plug 'lambdalisue/fern-git-status.vim', { 'as': 'fern-git-status' }

let g:fern_git_status_path=expand('~/.vim/plugged/fern-git-status')


call plug#end()

" :h shell
" "
"
" Name of the shell to use for ! and :! commands.
" "
set shell=/bin/bash

" :h number
" "
" 
" Print the line number in front of each line. 
" "
set number

" :h fillchars
" "
" 
" 'eob' (end-of-buffer) lines display a whitespace ('\ ')
" "
set fillchars=eob:\ 

" :h scrollof
" "
" 
" Minimal number of screen lines to keep above and below the cursor.
" "
set scrolloff=4

" :h tabstop
" "
"
" Defines the column multiple used to display the Horizontal Tab character (ASCII 9);
" "
set tabstop=4

" :h softtabstop 
" "
"
" Create soft tab stops, separated by 'softtabstop' number of columns.:
" "
set softtabstop=4

" :h shiftwidth
" "
"
" Number of columns that make up one level of (auto)indentation.
" "
set shiftwidth=4

" :h smartindent
" "
"
" Do smart autoindenting when starting a new line.
" "
set smartindent

" :h nowrap
" "
"
" This option changes how text is displayed.
" "
set nowrap

" :h expandtab
" "
"
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" "
set expandtab

" :h mouse
" "
"
" Enable the use of the mouse.
" Modes:
" - n - Normal mode and Terminal modes
" - v - Visual mode
" - i - Insert mode
" - c - Command-line mode
" - h - all previous modes when editing a help file
" - a - all previous modes
" - r - for |hit-enter| and |more-prompt| prompt
" "
set mouse=a

" :h nohlsearch
" "
"
" When there is a previous search pattern, highlight all its matches.
" "
set nohlsearch

" :h incsarch
" "
"
" While typing a search command, show where the pattern, as it was typed so far, matches.
" "
set incsearch

" :h noshowmode
" "
"
" If in Insert, Replace or Visual mode put a message on the last line.
" "
set noshowmode

" :h netwr
" :h netwr-browser-settings
" :h netwr-browser-options
" :h netwr-browser-var
" "
"
" Set the default listing style:
" = 0: thin listing (one file per line)
" = 1: long listing (one file per line with time
"      stamp information and file size)
" = 2: wide listing (multiple files in columns)
" = 3: tree style listing
" "
let g:netrw_liststyle=3

" enable/suppress the banner
" =0: suppress the banner
" =1: banner is enabled (default)
" "
let g:netrw_banner=0

" Controlled by the "a" map (see |netrw-a|)
" =0 : show all
" =1 : show not-hidden files
" =2 : show hidden files only
"  default: =1
" "
let g:netrw_hide=1

if isdirectory(g:fern_path)

    " :h Fern
    " :h fern
    " :h fern-mapping
    " :h fern-mapping-global
    " :h fern-custom-smart
    " "
    function! FernInit() abort

        " fern#smart#leaf:
        "   Return a mapping expression determined by a status of a current cursor node
        nmap <buffer><expr> <Enter>
        \ fern#smart#leaf(
        \ "<Plug>(fern-action-open)",
        \ "<Plug>(fern-action-expand)",
        \ "<Plug>(fern-action-collapse)"
        \ )
        
        " fern-action-hidden:toggle:
        "   Toggle hidden nodes.
        "   For example hidden nodes in file:// scheme is a file or directory starts from '.' character.
        nmap <buffer> gh
        \ <Plug>(fern-action-hidden:toggle)

        " fern-action-reload:
        "   An alias to "reload:all" action.
        "   Users can overwrite this mapping to change the default behavior of "reload" action like:
        nmap <buffer> r
        \ <Plug>(fern-action-reload)

        " fern-action-open:split:
        " fern-action-open:vsplit:
        " fern-action-open:tabedit:
        "   Open a cursor node or marked nodes with a corresponding command.
        "   The command will be applied on an "anchor" window when invoked from a
        "   drawer style fern (|fern-glossary-anchor|.)
        nmap <buffer> s
        \ <Plug>(fern-action-open:split)
        nmap <buffer> v
        \ <Plug>(fern-action-open:vsplit)

    endfunction

    augroup FernEvents

        autocmd!
        autocmd FileType fern call FernInit()

        " replace netrw with fern
        autocmd VimEnter * command! Explore  Fern . -reveal=%
        autocmd VimEnter * command! Vexplore Fern . -reveal=% -opener=vsplit
        autocmd VimEnter * command! Sexplore Fern . -reveal=% -opener=split
        autocmd VimEnter * command! Lexplore Fern . -reveal=% -drawer -width=25

    augroup END

    " Set 1 to enter hidden mode (show hidden files) in default.
    " Default: 0
    " "
    let g:fern#default_hidden=1

endif

if isdirectory(g:fern_git_status_path)

    let g:fern_git_status#disable_ignored=1

    let g:fern_git_status#disable_untracked=1

    let g:fern_git_status#disable_submodules=1

endif

" :h laststatus
" "
"
" The value of this option influences when the last window will have a status line:
" 0: never
" 1: only if there are at least two windows
" 2: always
" "
set laststatus=2

" :h statusline 
" "
"
" When non-empty, this option determines the content of the status line.
" "
set statusline=%!_statln()
function! _statln()

    let line  = '[%{mode(0)}] %f %m '
    let line .= '%='
    let line .= '%y %l:%v/%L (%p%%)'
    return (line)

endfunction

" :h showtabline
" "
"
" The value of this option specifies when the line with tab page labels will be displayed:
" 0: never
" 1: only if there are at least two tab pages
" 2: always
" "
set showtabline=1

" :h syntax 
" "
"
" When this option is set, the syntax with this name is loaded, unless syntax highlighting has been switched off with ":syntax off".
" "
set syntax=clean
if exists('+termguicolors')

    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

    if isdirectory(g:catppuccin_path) | colorscheme catppuccin_mocha | endif

endif

command! -nargs=? -complete=customlist,_skeleton_complete Skeleton call _skeleton(<f-args>)
function! _skeleton(...)

    " get extension from args
    if a:0 > 0 && !empty(a:1)
        let l:ext = a:1

    " otherwise, deduce extension based on the current file's extension
    else
        " get file extension
        let l:ext = expand('%:e')
        if empty(l:ext) " usually case for a file with no ext.: Makefile, Dockerfile etc.

            let l:ext = &filetype

        endif
        if empty(l:ext) " unsupported file type...

            echoerr 'Invalid file type: ' . l:ext
            return

        endif
    endif

    let l:template = expand('~/.vim/templates/skeleton.' . l:ext)
    if !filereadable(l:template)

        echoerr 'No template found: ' . l:template
        return

    endif

    " insert template
    execute '0r ' . fnameescape(l:template)

endfunction

function! _skeleton_complete(ArgLead, CmdLine, CursorPos)

    " get the list of templates
    let l:templates = glob(resolve(expand('~/.vim/templates/')) . 'skeleton.*', 0, 1)

    " get the list of names from templates
    let l:names = map(l:templates, {_, f -> fnamemodify(f, ':e')})
    
    if empty(a:ArgLead)
    
        return (l:names)
    
    endif

    return (filter(l:names, {_, n -> n =~ '^' . a:ArgLead}))

endfunction
