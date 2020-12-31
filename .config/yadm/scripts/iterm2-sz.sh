#!/bin/bash

# iTerm2 Trigger
# Regular Expressions: rz waiting to receive.\*\*B0100
# Action: Run Slient Coprocess

FILE=$(osascript -e 'set thefile to choose file' -e "do shell script (\"echo \"&(quoted form of POSIX path of thefile as Unicode text)&\"\")")

if [[ "$FILE" = "" ]]; then
  echo -e \\x18\\x18\\x18\\x18\\x18
  sleep 1
  echo
else
  /usr/local/bin/sz "$FILE" --escape --binary --bufsize 4096
  sleep 1
  echo
fi
