execute pathogen#infect()

set t_Co=256
colorscheme Tomorrow-Night-Bright

let g:syntastic_check_on_open = 1
let g:syntastic_lua_checkers = ["luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"

let g:LookOfDisapprovalTabTreshold=5
let g:LookOfDisapprovalSpaceTreshold=20

let g:syntastic_c_include_dirs = ["/usr/include/lua5.1","inc"]

set backspace=indent,eol,start
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set ruler
set showcmd                             " display incomplete commands
set visualbell t_vb=                    " turn off error beep/flash
set novisualbell
set number

syntax on
set hlsearch

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if has("autocmd")
    filetype plugin indent on

    autocmd BufNewFile,BufRead *.rss,*.atom set filetype=xml
    autocmd BufNewFile,BufRead *.rl set cindent filetype=ragel

    " Syntax of these languages is fussy over tabs versus spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noet
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et

    " Reduce filesize by using tabs
    autocmd FileType css setlocal ts=2 sts=2 sw=2 noet
    autocmd FileType html setlocal ts=2 sts=2 sw=2 noet
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et

    " Fix these filetypes on load
    autocmd BufWritePre *.c,*.go,*.py,*.js :call <SID>StripTrailingWhitespace()
endif

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespace()<CR>
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Perform the substitution command
    %s/\s\+$//e
    " Cleanup: restore the previous search history and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store?                      " OSX bullshit
" }}}
