# enable git branch  (Note:  is the git branch icon and needs a supported font to be shown)
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' formats ' %11F( %b)%f'

# set prompt
setopt PROMPT_SUBST
export PS1='%B%40F%n@%m%f:%31F%1~%f${vcs_info_msg_0_} \$ %b'

# OSX Specific
if [ $(uname) = "Darwin" ]; then
    alias ls="ls -lhG"                                              # Better ls
    export PATH="/usr/local/bin:$PATH"                              # Homebrew
    export PATH="/usr/local/sbin:$PATH"                             # Homebrew (system)
    export PATH="/usr/local/opt/python/libexec/bin/:$PATH"          # Python3 symlink as python
    export PATH="/usr/local/opt/llvm/bin:$PATH"                     # LLVM package for clangd
    export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"    # Android sdk
# Linux Specific
else
    export PS1="%B$PS1%b"                   # Use bold prompt in linux
    alias ls="ls -lh --color=auto"          # Better ls
fi

# Same for OSX and Linux
alias grep="grep --color=auto"
export PATH="$HOME/scripts:$PATH"
