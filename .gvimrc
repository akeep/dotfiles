" cause yank to pull into the system clipboard
set clipboard=unnamed

" set the guifont
if has("gui_macvim")
  set guifont=Menlo-Regular:h14
endif

" set the guioptions
set guioptions=ac

" make vim less noisy, by setting the visualbell option with an empty
" visualbell setting.
set novisualbell
set noerrorbells
set visualbell t_vb=

" stop the cursor from blinking
set guicursor+=a:blinkon0

" copy yanks to mac paste board
set clipboard=unnamed
