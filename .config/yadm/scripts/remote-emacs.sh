#!/bin/bash

# Add remote-emacs to ~/.ssh/config first

if [ -z $(which mosh) ]; then
  mosh remote-emacs -- emacs -nw
else
  ssh -t remote-emacs "emacs -nw"
fi
