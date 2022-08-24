echom "loaded experiment"

syn match experimentComment '\v\/\/.*$'
syn region experimentFuncall start='\v[a-zA-Z0-9_]+\s*\(' end=')' contains=ALL
syn region experimentAnnotation start='\v\@[a-zA-Z0-0:_]+\s*\(' end=')' contains=experimentFuncall

hi link experimentComment Comment
hi link experimentFuncall Special
hi link experimentAnnotation PreProc
