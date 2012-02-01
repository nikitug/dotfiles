if has("gui_macvim")
  set guifont=Monaco:h13
  set stal=2 " turn on tabs by default
elseif has("gui_gtk2")
  set guifont=Monaco\ 12
elseif has("x11")
elseif has("gui_win32")
end

set guioptions=ai

set anti " Antialias font

" Default size of window
set columns=119
set lines=40

" Color
color twilight_n

" Load bash init file
set shell=/bin/bash
set shellcmdflag=-ic

map <Leader>sv :so $MYGVIMRC<CR>

" TODO move this code to separate file
"if filereadable(expand("./vim/tabheadings.vim"))
  "source ./vim/tabheadings.vim
"endif
" Tab headings
function! GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '*' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label = '*'
            break
        endif
    endfor

    " Append the buffer name (not full path)
    return label . "%t"
endfunction
set gtl=%!GuiTabLabel() gtt=%F

