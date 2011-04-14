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

" Tab headings
set gtl=%t gtt=%F

" Color
color twilight

" Capfile is Ruby
au BufRead,BufNewFile {Capfile} set ft=ruby

set shell=bash
set shellcmdflag=-ic

