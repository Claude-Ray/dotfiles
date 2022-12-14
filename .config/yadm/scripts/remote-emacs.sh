#!/bin/bash

# Add remote-emacs to ~/.ssh/config first

if command -v mosh >/dev/null 2>&1; then
  mosh remote-emacs -- sh -c "tmux attach-session -t remote-emacs || tmux new-session -s remote-emacs 'emacs -nw'"
else
  ssh -t remote-emacs "tmux attach-session -t remote-emacs || tmux new-session -s remote-emacs 'emacs -nw'"
fi
