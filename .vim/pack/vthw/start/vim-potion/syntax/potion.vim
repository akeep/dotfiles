if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "potion"

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

syntax keyword potionFunction print join string

syntax match potionComment "\v#.*$"

syntax match potionOperator "\v:"
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

syntax match potionNumber "\v-?[1-9][0-9]*(\.[0-9]+)?(e(\+|-)[1-9][0-9]*)?"
syntax match potionNumber "\v0x[0-9a-fA-F]+"

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v'/ skip=/\v''/ end=/\v'/

highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator
highlight link potionNumber Number
highlight link potionString String
