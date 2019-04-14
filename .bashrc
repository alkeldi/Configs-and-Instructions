#Obtain the active git branch
git_branch() {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
   }

   #Define colors
   RED="\[\033[0;31m\]"
   YELLOW="\[\033[0;33m\]"
   GREEN="\[\033[0;32m\]"
   WHITE="\[\033[0m\]"
   BLUE="\[\033[34m\]"

   #Personal PS1
   PS1="$GREEN\u@\h$WHITE:$BLUE\W$YELLOW\$(git_branch)$WHITE$ "

   #Commands shortcuts
   alias ls="ls -hFl --color=auto"
   alias grep="grep --color=auto"
   alias ngrep="grep --color=auto -n"
   alias chat="write"
   alias gdb='gdb -quiet'

   ################## REMOVE THE FOLLOWING ##################
   #xinu setup
   #export PATH=${PATH}:/p/xinu/bin
   #export CS_CLASS=quark
