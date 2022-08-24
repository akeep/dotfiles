" Implement a version of yank that returns the cursor to where it was at the atar
" start of the yank (as it probably should be, for consitency at least)
function! s:go(...) abort
  echom "starting go with position " . string(s:orig_cursor_pos)
  let s:orig_cursor_pos=getpos("''")
  echom "s:orig_cursor_pos: " . string(s:orig_cursor_pos)
  if !a:0
    echom "!a:0 branch"
    let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
    return 'g@'
  elseif a:0 > 1
    echom "a:0 (" . a:0 . ") > 1 branch"
    let [lnum1, lnum2] = [a:1, a:2]
  else
    echom "a:0 (" . a:0 . ") else branch"
    let [lnum1, lnum2] = [line("'["), line("']")]
  endif
  echom "calling yank with arguments: [" . lnum1 . ", " . lnum2 . "]"
  execute(":normal [" . lnum1 . "," . lnum2 . "]y")
  echom "returning to " . string(s:orig_cursor_pos)
  call setpos(".", s:orig_cursor_pos)
endfunction

xnoremap <expr> <Plug>OldSchoolYank <SID>go()
nnoremap <expr> <Plug>OldSchoolYank <SID>go()
nnoremap <expr> <Plug>OldSchoolYankLine <SID>go() . '_'

if !hasmapto('<Plug>OldSchoolYank') || maparg('gc', 'n') ==# ''
  xmap y <Plug>OldSchoolYank
  nmap y <Plug>OldSchoolYank
  nmap yy <Plug>OldSchoolYankLine
endif
