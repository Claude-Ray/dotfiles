#!/bin/bash

# Add remote-emacs to ~/.ssh/config first

if command -v mosh >/dev/null 2>&1; then
  mosh remote-emacs -- emacs -nw
else
  ssh -t remote-emacs "emacs -nw"
fi
