if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ -d "/opt/homebrew" ]]; then
    # Setup fzf
    # ---------
    if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
      PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
    fi

    # Auto-completion
    # ---------------
    [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
  else
    # Setup skim
    if [[ ! "$PATH" == */usr/local/opt/sk/bin* ]]; then
      export PATH="${PATH:+${PATH}:}/usr/local/opt/sk/bin"
    fi

    # Auto-completion
    [[ $- == *i* ]] && source "/usr/local/share/zsh/site-functions/completion.zsh" 2> /dev/null

    # Key bindings
    source "/usr/local/share/zsh/site-functions/key-bindings.zsh"
  fi
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  # source "/usr/share/skim/completion.zsh"
  # source "/usr/share/skim/key-bindings.zsh"

  source "/usr/share/fzf/completion.zsh"
  source "/usr/share/fzf/key-bindings.zsh"
fi

# Custom
export SKIM_DEFAULT_COMMAND='fd --type f'
export SKIM_CTRL_T_COMMAND="command fd -L --color never 2>/dev/null"
export SKIM_ALT_C_COMMAND="command fd -HL --color never -t d 2>/dev/null"

export FZF_DEFAULT_COMMAND="$SKIM_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND="$SKIM_CTRL_T_COMMAND"
export FZF_ALT_C_COMMAND="$SKIM_ALT_C_COMMAND"
