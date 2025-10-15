vim.cmd([[
" " relative line numbers in normal mode, absolute line numbers in insert mode
" set number relativenumber
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

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

" stop space from moving cursor
nnoremap <Space> <Nop>

" Map leader esc to exit terminal mode
tnoremap <leader><esc> <c-\><c-n>

" move vertically by visual line (don't skip wrapped lines)
nnoremap j gj
nnoremap k gk

" make 'Y' yank from cur pos to end of line instead of yanking the whole line
nnoremap Y y$

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
]])
