"set hidden " hide buffers

set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo

set nobackup
set noswapfile

set pastetoggle=<F4>

" nnoremap ; :

cmap w!! w !sudo tee % >/dev/null

" Colors
set t_Co=256
color wombat256

" Filetypes
au BufRead,BufNewFile Capfile setfiletype ruby
au BufNewFile,BufRead todo, TODO setfiletype task
au FileType task set autoindent
au BufNewFile,BufRead *.php setfiletype php
au FileType php set tabstop=4 softtabstop=4 shiftwidth=4 wrapmargin=4 textwidth=79
au FileType java set tabstop=4 softtabstop=4 shiftwidth=4 wrapmargin=4 textwidth=79

" Map keys
au FileType task inoremap <silent> <buffer> <C-d> <ESC>:call Toggle_task_status()<CR>i
au FileType task noremap <silent> <buffer> <C-d> :call Toggle_task_status()<CR>

" Folding
map + v%zf

vmap > >gv
vmap < <gv

map <F2> :noh<CR>
map <F3> :set nowrap!<CR>

map <Leader>tm :call StartViewportTerm()<CR>

map <C-F> :Ack<space>
imap <C-F> <ESC>:Ack<space>

imap <Leader>t <ESC>:CommandT<CR>
imap <Leader>b <Esc>:CommandTBuffer<CR>

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

map <Leader>wr :%s/\s*$//<CR>:noh<CR>

map <Leader>sv :so $MYVIMRC<CR>

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

" <F8> File encoding for open
" ucs-2le - MS Windows unicode encoding
map <F8> :execute RotateEnc()<CR>
" vmap <F8><C-C><F8>
" imap <F8><C-O><F8>
let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#cp1251#utf-8#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction
