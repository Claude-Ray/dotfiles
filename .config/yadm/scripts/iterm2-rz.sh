#!/bin/bash

# iTerm2 Trigger
# Regular Expressions: \*\*B00000000000000
# Action: Run Slient Coprocess

cd "$HOME/Downloads"
/usr/local/bin/rz --rename --escape --binary --bufsize 4096
sleep 1
echo
