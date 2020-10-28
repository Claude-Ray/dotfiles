if [[ "$OSTYPE" == "darwin"* ]]; then
  # Setup skim
  if [[ ! "$PATH" == */usr/local/opt/sk/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/usr/local/opt/sk/bin"
  fi

  # Auto-completion
  [[ $- == *i* ]] && source "/usr/local/share/zsh/site-functions/completion.zsh" 2> /dev/null

  # Key bindings
  source "/usr/local/share/zsh/site-functions/key-bindings.zsh"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  source "/usr/share/zsh/site-functions/_sk"
fi

# Custom
export SKIM_DEFAULT_COMMAND='fd --type f'
export SKIM_CTRL_T_COMMAND="command fd -L --color never 2>/dev/null"
export SKIM_ALT_C_COMMAND="command fd -HL --color never -t d 2>/dev/null"
