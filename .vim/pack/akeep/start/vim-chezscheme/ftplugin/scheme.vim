if exists('b:did_ftplugin')
  finish
endif

let s:cpo = &cpo
set cpo&vim

setlocal lisp
setlocal comments=:;;;;,:;;;,:;;,:;,sr:#\|,mb:\|,ex:\|#
setlocal commentstring=;%s
setlocal define=^\\s*(def\\k*
setlocal iskeyword=33,35-39,42-43,45-58,60-90,94,95,97-122,126
let b:undo_ftplugin = 'setlocal lisp< comments< commentstring< define< iskeyword<'

setlocal lispwords=case
setlocal lispwords=record-case
setlocal lispwords=rec
setlocal lispwords+=define
setlocal lispwords+=trace-define
setlocal lispwords+=define-record-type
setlocal lispwords+=define-syntax
setlocal lispwords+=trace-define-syntax
setlocal lispwords+=define-values
setlocal lispwords+=do
setlocal lispwords+=trace-do
setlocal lispwords+=guard
setlocal lispwords+=lambda
setlocal lispwords+=lambda
setlocal lispwords+=trace-lambda
setlocal lispwords+=let
setlocal lispwords+=fluid-let
setlocal lispwords+=fluid-let-syntax
setlocal lispwords+=trace-let
setlocal lispwords+=let*
setlocal lispwords+=let*-values
setlocal lispwords+=let-syntax
setlocal lispwords+=let-values
setlocal lispwords+=letrec
setlocal lispwords+=letrec*
setlocal lispwords+=letrec-syntax
setlocal lispwords+=with-syntax
setlocal lispwords+=with-implicit
setlocal lispwords+=with-mutex
setlocal lispwords+=parameterize
setlocal lispwords+=set!
setlocal lispwords+=syntax-rules
setlocal lispwords+=syntax-case
setlocal lispwords+=unless
setlocal lispwords+=when
setlocal lispwords+=module
setlocal lispwords+=library
setlocal lispwords+=eval-when
setlocal lispwords+=define-values
setlocal lispwords+=define-structure
setlocal lispwords+=define-record
setlocal lispwords+=define-property
setlocal lispwords+=define-ftype
setlocal lispwords+=define-enumeration
setlocal lispwords+=define-condition-type
setlocal lispwords+=identifier-syntax

let b:undo_ftplugin = b:undo_ftplugin . ' lispwords<'

let b:did_scheme_ftplugin = 1

unlet b:did_scheme_ftplugin
let b:did_ftplugin = 1
let &cpo = s:cpo
unlet s:cpo
