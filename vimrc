" Colors
set t_Co=256
color wombat256

" Filetypes
au BufRead,BufNewFile Capfile setfiletype ruby
au BufNewFile,BufRead todo, TODO setfiletype task
au FileType task set autoindent
au BufNewFile,BufRead *.php setfiletype php
au FileType php set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79

" Map keys
au FileType task inoremap <silent> <buffer> <C-d> <ESC>:call Toggle_task_status()<CR>i
au FileType task noremap <silent> <buffer> <C-d> :call Toggle_task_status()<CR>

vmap > >gv
vmap < <gv

map <Leader>tm :call StartViewportTerm()<CR>

map <C-F> :Ack<space>
imap <C-F> <ESC>:Ack<space>

imap <Leader>t :CommandT<CR>
imap <Leader>b <Esc>:CommandT<CR>

imap <A-]> <ESC>V><ESC>
map <A-]> <ESC>V><ESC>
imap <A-[> <ESC>V<<ESC>
map <A-[> <ESC>V<<ESC>

nmap <C-k> [e
nmap <C-j> ]e
vmap <C-h> xhPgvohoh
vmap <C-l> xlPgvolol
vmap <C-k> [egv
vmap <C-j> ]egv

map <Leader>wr :%s/\s*$//<CR>|noh<CR>

" Switch tabs
map  <A-0> 0gt
imap <A-0> <Esc>0gt
map  <A-1> 1gt
imap <A-1> <Esc>1gt
map  <A-2> 2gt
imap <A-2> <Esc>2gt
map  <A-3> 3gt
imap <A-3> <Esc>3gt
map  <A-4> 4gt
imap <A-4> <Esc>4gt
map  <A-5> 5gt
imap <A-5> <Esc>5gt
map  <A-6> 6gt
imap <A-6> <Esc>6gt
map  <A-7> 7gt
imap <A-7> <Esc>7gt
map  <A-8> 8gt
imap <A-8> <Esc>8gt
map  <A-9> 9gt
imap <A-9> <Esc>9gt

" TODO check color scheme
" ConqueTerm wrapper
function! StartViewportTerm()
  :bo10sp
  execute 'ConqueTerm ' . $SHELL . ' -i'
  setlocal listchars=tab:\ \ 
endfunction

