# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -x "$(which nvim)" ] && alias vi="nvim" || alias vi="vim"
[ -x "$(which lsd)" ] && alias ls="lsd"
[ -x "$(which bat)" ] && alias b="bat"
[ -x "$(which trash)" ] && alias rm="echo Use 'trash' please!"

alias e="emacsclient"

alias ni="npm install"
alias nr="npm run"

alias g="git"
alias gg="git clone"
alias gcm="git commit -m"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gd="git diff"
alias gb="git branch"
alias gst="git status"
