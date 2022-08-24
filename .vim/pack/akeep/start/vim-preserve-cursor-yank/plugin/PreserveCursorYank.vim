" preserve-cursor-yank sets up yank to return the cursor to the position the
" yank started from, instead of leaving it at the top of the selection area,
" which is vim's regular behavior.
"
" it turns out this is tricky to do, so this plugin is based on EasyClip,
" https://github.com/svermeulen/vim-easyclip, which also does this, when the
" g:EasyClipPreserveCursorPositionAfterYank option is enabled, but it also
" does a number of other things that I was less interested in having.
" The map style is from tpope's commentary plugin,
" https://github.com/tpope/vim-commentary/blob/master/plugin/commentary.vim
"
if exists('g:loaded_PreserveCursorYank')
  finish
endif

let g:loaded_PreserveCursorYank = 1

" script local variables
let s:activeRegister = '"'
let s:yankCount = 0
let s:preYankWinView = {}

function! s:PreYankMotion()
  let s:yankCount = v:count > 0 ? v:count : 1
  let s:activeRegister = v:register

  " This is necessary to get around a bug in vim where the active register persists to
  " the next command. Repro by doing "_d and then a command that uses v:register
  if s:activeRegister ==# "_"
    let s:activeRegister = '"'
  endif

  let s:preYankPos = getpos('.')
  let s:preYankWinView = winsaveview()
endfunction

function! s:YankLastChangedText(type, reg)
  if &selection ==# 'exclusive'
    let excl_right = "\<right>"
  else
    let excl_right = ""
  endif

  if a:type !=# 'line' && a:type !=# 'char'
    echoerr "Unexpected selection type '" . a:type . "'"
    return
  endif

  execute "keepjumps normal! `[" . (a:type ==# 'line' ? 'V' : 'v')
    \ . "`]" . excl_right . '"' . s:activeRegister . "y"
endfunction

function! s:YankMotion(type)
  let oldVisualStart = getpos("'<")
  let oldVisualEnd = getpos("'>")
  
  call <sid>YankLastChangedText(a:type, s:activeRegister)

  call setpos("'<", oldVisualStart)
  call setpos("'>", oldVisualEnd)

  if !empty(s:preYankWinView)
    call winrestview(s:preYankWinView)
    let s:preYankWinView = {}

    " This is necessary for some reason otherwise if you go down a line it will
    " jump to the column where the yank normally positions the cursor by default
    " To repro just remove this line, run yiq inside quotes, then go down a line
    if col('.') == col('$')-1
      normal! hl
    else
      normal! lh
    endif
  endif
endfunction

function! s:YankLine()
  execute 'normal! ' . s:yankCount . '"' . s:activeRegister . 'yy'
  call setpos('.', s:preYankPos)
endfunction

function! s:VisualModeYank(reg)
  execute "normal! gv\"" . a:reg . "y"
  execute "normal! gv\<Esc>"
endfunction

" plug mappings
nnoremap <silent> <Plug>YankLinePreserveCursorPosition :<c-u>call <sid>PreYankMotion()<cr>:call <sid>YankLine()<cr>
nnoremap <silent> <expr> <Plug>YankPreserveCursorPosition ":<c-u>call <sid>PreYankMotion()<cr>:set opfunc=<sid>YankMotion<cr>" . (v:count > 0 ? v:count : '') . "g@"
xnoremap <silent> <Plug>VisualModeYank :<c-u>call <sid>VisualModeYank(v:register)<cr>

if !hasmapto('<Plug>YankPreserveCursorPosition') || maparg('y', 'n') ==# ''
  xmap y <Plug>VisualModeYank
  nmap y <Plug>YankPreserveCursorPosition
  nmap yy <Plug>YankLinePreserveCursorPosition
endif
