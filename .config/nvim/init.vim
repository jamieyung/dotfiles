" set the leader key
let mapleader = " "

" -----------------------------------------------------------------------------
" -- vim-plug -----------------------------------------------------------------
" -----------------------------------------------------------------------------

" after adding plugins below, install with:
" :source %
" :PlugInstall

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-obsession'

Plug 'christoomey/vim-tmux-navigator'

" Common shell commands (rename, delete, etc)
Plug 'tpope/vim-eunuch'

" Undo tree visual
Plug 'mbbill/undotree'

" Colour schemes
Plug 'NLKNguyen/papercolor-theme'

" Better statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Language server support for purescript
Plug 'frigoeu/psc-ide-vim'

" Search
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Multi-file search/replace
Plug 'wincent/ferret'

" File explorer
Plug 'preservim/nerdtree'

" Comments
Plug 'tpope/vim-commentary'

" Highlights yank
Plug 'machakann/vim-highlightedyank'

" Surround
Plug 'tpope/vim-surround'

" Show number and index of search matches
Plug 'google/vim-searchindex'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Haxe
Plug 'jdonaldson/vaxe'

call plug#end()

" -----------------------------------------------------------------------------
" -- Plugin config ------------------------------------------------------------
" -----------------------------------------------------------------------------

" vim-tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1 "use custom mappings below
" Meta + direction to move between splits in any mode.
" On Mac, make sure "Use Option as Meta key" is enabled.
tnoremap <M-h> <C-\><C-N>:TmuxNavigateLeft<CR>
tnoremap <M-j> <C-\><C-N>:TmuxNavigateDown<CR>
tnoremap <M-k> <C-\><C-N>:TmuxNavigateUp<CR>
tnoremap <M-l> <C-\><C-N>:TmuxNavigateRight<CR>

inoremap <M-h> <C-\><C-N>:TmuxNavigateLeft<CR>
inoremap <M-j> <C-\><C-N>:TmuxNavigateDown<CR>
inoremap <M-k> <C-\><C-N>:TmuxNavigateUp<CR>
inoremap <M-l> <C-\><C-N>:TmuxNavigateRight<CR>

nnoremap <M-h> :TmuxNavigateLeft<CR>
nnoremap <M-j> :TmuxNavigateDown<CR>
nnoremap <M-k> :TmuxNavigateUp<CR>
nnoremap <M-l> :TmuxNavigateRight<CR>

" NERDTree - Map <leader>n to opening NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" NERDTree - Open NERDTree when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" NERDTree - Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" gitgutter
let g:gitgutter_map_keys = 0

" fzf.vim
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>

" ferret
let g:FerretMap = 0
nmap <leader>a <Plug>(FerretAck)
nmap <leader>s <Plug>(FerretAckWord)

" vim-airline
let g:airline#extensions#branch#displayed_head_limit = 10 " truncates branch names to 10

" -----------------------------------------------------------------------------
" -- Misc ---------------------------------------------------------------------
" -----------------------------------------------------------------------------

function! ToggleTerm() abort
    if !has('nvim')
        return v:false
    endif

    " Create the terminal buffer.
    if !exists('g:terminal') || !g:terminal.term.loaded
        return CreateTerm()
    endif

    " Go back to origin buffer if current buffer is terminal.
    if g:terminal.term.bufferid ==# bufnr('')
        silent execute 'buffer' g:terminal.origin.bufferid

    " Launch terminal buffer and start insert mode.
    else
        let g:terminal.origin.bufferid = bufnr('')

        silent execute 'buffer' g:terminal.term.bufferid
        startinsert
    endif
endfunction

" Create the 'default' terminal buffer.

function! CreateTerm() abort
    if !has('nvim')
        return v:false
    endif

    if !exists('g:terminal')
        let g:terminal = {
            \ 'opts': {},
            \ 'term': {
                \ 'loaded': v:null,
                \ 'bufferid': v:null
            \ },
            \ 'origin': {
                \ 'bufferid': v:null
            \ }
        \ }

        function! g:terminal.opts.on_exit(jobid, data, event) abort
            silent execute 'buffer' g:terminal.origin.bufferid
            silent execute 'bdelete!' g:terminal.term.bufferid

            let g:terminal.term.loaded = v:null
            let g:terminal.term.bufferid = v:null
            let g:terminal.origin.bufferid = v:null
        endfunction
    endif

    if g:terminal.term.loaded
        return v:false
    endif

    let g:terminal.origin.bufferid = bufnr('')

    enew
    call termopen(&shell, g:terminal.opts)

    let g:terminal.term.loaded = v:true
    let g:terminal.term.bufferid = bufnr('')
endfunction

nnoremap <silent> <A-CR> :call ToggleTerm()<Enter>
inoremap <silent> <A-CR> <C-\><C-n>:call ToggleTerm()<Enter>
tnoremap <silent> <A-CR> <C-\><C-n>:call ToggleTerm()<Enter>

" Show either vim help or call coc doHover
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ "\<TAB>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <expr><C-f> coc#util#float_scroll(1)
nnoremap <expr><C-b> coc#util#float_scroll(0)
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)
nmap <silent> <C-p> <Plug>(coc-diagnostic-prev)
nmap <Leader>cf <Plug>(coc-fix-current)
nmap <Leader>cn <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" git-gutter uses the sign gutter
set signcolumn=yes

" Use <Leader>c for ciw with repeatability
nnoremap <silent> <Leader>c :let @/=expand('<cword>')<cr>cgn

" Run macro over visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Move lines down/up
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Unfold all by default
set foldlevelstart=9

" Close buffer but keep splits
nnoremap <silent> <leader>d :call CloseBuffer()<cr>
function! CloseBuffer()
    let curBuf = bufnr('%')
    let curTab = tabpagenr()
    exe 'bnext'

    " If in last buffer, create empty buffer
    if curBuf == bufnr('%')
        exe 'enew'
    endif

    " Loop through tabs
    for i in range(tabpagenr('$'))
        " Go to tab (is there a way with inactive tabs?)
        exe 'tabnext ' . (i + 1)
        " Store active window nr to restore later
        let curWin = winnr()
        " Loop through windows pointing to buffer
        let winnr = bufwinnr(curBuf)
        while (winnr >= 0)
            " Go to window and switch to next buffer
            exe winnr . 'wincmd w | bnext'
            " Restore active window
            exe curWin . 'wincmd w'
            let winnr = bufwinnr(curBuf)
        endwhile
    endfor

    " Close buffer, restore active tab
    exe 'bd' . curBuf
    exe 'tabnext ' . curTab
endfunction

" relative line numbers in normal mode, absolute line numbers in insert mode
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Autoread fix
" au FocusGained,BufEnter * :silent! !
" au FocusLost,WinLeave * :silent! noautocmd w

" stop space from moving cursor
nnoremap <Space> <Nop>

" live preview of substitute
set inccommand=split

" Map leader esc to exit terminal mode
tnoremap <leader><esc> <c-\><c-n>

" use system clipboard for copy paste
set clipboard=unnamed

" sets cursor back to solid block on exiting vim
au VimLeave * set guicursor=a:block-blinkon0

set hidden

" color scheme
colorscheme PaperColor

" set updatetime to 100ms to make gitgutter more responsive
set updatetime=100

" show line numbers
set number

" enable mouse
set mouse=a

" set encoding to UTF-8
set encoding=utf-8

" visual autocomplete for command menu
set wildmenu

" redraw screen only when need to
set lazyredraw

" highlight matching parens/brackets [{()}]
set showmatch

" always show statusline (even with only a single window)
set laststatus=2

" show line and column number of the cursor on right side of statusline
set ruler

" blink cursor on error instead of beeping
set visualbell

" instead of failing a command because of unsaved changes, raise a dialog
" asking if you wish to save changed files.
set confirm

" maintain undo history between sessions
set undofile

" store undofiles in single directory
set undodir=~/.config/nvim/undodir//

" disable swapfiles
set noswapfile

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" show command in bottom bar
set showcmd

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

" faster write and/or exit
nnoremap <leader>z :wq<CR>
nnoremap <leader>w :w<CR>

" make 'Y' yank from cur pos to end of line instead of yanking the whole line
nnoremap Y y$

" paste on newline (eg. yiw will paste on newline)
nnoremap <leader>p :pu<CR>

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on

" indentation settings for using 4 spaces instead of tabs.
" do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" copy indent from current line when starting a new line
set autoindent

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" turn off search highlighting (using leader cr instead of only cr because
" cr is needed for completion and in other contexts).
nnoremap <leader><CR> :nohlsearch<CR>

" show whitespace
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Swap : and ; to make colon commands easier to type
nnoremap ; :
nnoremap : ;

" Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

nnoremap H ^
nnoremap L $

