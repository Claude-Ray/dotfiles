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
[ -x "$(which trans)" ] && alias t="trans -v"
[ -x "$(which trash)" ] && alias rm="echo Use 'trash' please!"

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  alias vim="ez"
  alias vi="ez"
fi

alias ssh="TERM=xterm-256color ssh"

alias ni="npm install"
alias nr="npm run"

alias g="git"
alias gg="git clone"
alias gcm="git commit -m"
alias gcb="git_checkout_or_create"
alias gco="git checkout"
alias gd="git diff"
alias gb="git branch"
alias gst="git status"
