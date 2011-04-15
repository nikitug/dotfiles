if has("gui_macvim")
  set guifont=Monaco:h13
  set stal=2 " turn on tabs by default
elseif has("gui_gtk2")
  set guifont=Monaco\ 12
elseif has("x11")
elseif has("gui_win32")
end

set anti " Antialias font

" Default size of window
set columns=179
set lines=50

" Color
color twilight

" Load bash init file
set shell=/bin/bash
set shellcmdflag=-ic

" Filetypes
au BufRead,BufNewFile Capfile setfiletype ruby
au BufNewFile,BufRead todo, TODO setfiletype task
au FileType php set tabstop=4 textwidth=79

" Map keys
au FileType task inoremap <silent> <buffer> <C-CR> <ESC>:call Toggle_task_status()<CR>i
au FileType task noremap <silent> <buffer> <C-CR> :call Toggle_task_status()<CR>
vmap > >gv
vmap < <gv
map <Leader>tm :call StartTerm()<CR>
map <C-F> :Ack<space>

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

" TODO move this code to separate file
"if filereadable(expand("./vim/tabheadings.vim"))
  "source ./vim/tabheadings.vim
"endif
" Tab headings
function GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '*' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label = '*'
            break
        endif
    endfor

    " Append the number of windows in the tab page if more than one
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= wincount
    endif

    " Append the buffer name (not full path)
    return label . "%t"
endfunction
set gtl=%!GuiTabLabel() gtt=%F

" TODO check color scheme
" ConqueTerm wrapper
function! StartTerm()
  :bo10sp
  execute 'ConqueTerm ' . $SHELL . ' -i'
  setlocal listchars=tab:\ \ 
endfunction

