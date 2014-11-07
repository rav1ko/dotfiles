# Common shell functions
alias tf='tail -f'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g G="| grep"
alias top="htop"

# Python
alias py="python"
alias py2="python2"

# jump to recently used items
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # interactive directory jump

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'
alias ll='ls -alGh --color=auto'
alias ls='ls -Gh --color=auto'

# Override rm -i alias which makes rm prompt for every action
alias rm='nocorrect rm'
