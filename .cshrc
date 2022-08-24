set cdpath = ($home)
set notify
set history=1000
unset savehist 
umask 027
alias h 'history | tail -22'

alias rm 'rm -i'
alias cp 'cp -pi'
alias mv 'mv -i'
alias vi vim

if ( $OSTYPE == "darwin" ) alias gvim mvim

set path = (. /Applications/MacVim.app/Contents/bin /Applications/Racket\ v6.1.1/bin $home/bin /usr/texbin /usr/local/sbin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/X11/bin)

# make tcsh a little more featureful
set autolist
set autosuffix
set rmstar
set noclobber
set prompt="[%n@%m %c]%# "

setenv EDITOR vim


# copied from chezwork file
set chezversion = 8.0.1
set chezhome = "/Volumes/Scheme/csv$chezversion"
set machine = "i3osx"
set workspace = "$chezhome/$machine"

alias tmo 'tail -f Make.out'
alias mmo 'more Make.out'

alias makeout 'make \!* >&! Make.out'
alias makeoutw 'make \!* >&! Make.out &; tail -f Make.out'
alias makecross "makeout -f Mf-cross m=$machine xm=$machine i=t o=2"
alias makecrossw "makeoutw -f Mf-cross m=$machine xm=$machine i=t o=2"
alias sgrep 'grep -r --include=\*.ss \!* *'
alias frgrep 'grep -r --include=\*.fractL-lib --include=\*.fractL-prog \!* *'

setenv SCHEMEHEAPDIRS ".:../boot/%m:$home/release/csv%v/boot/%m:"

alias chezwork "cd $workspace/s"

# OPAM configuration
source /Users/akeep/.opam/opam-init/init.csh >& /dev/null || true

# brew configuration help
setenv HOMEBREW_GITHUB_API_TOKEN 28b24cd1d60668c4de968cd5d44301b8b39b0e66
