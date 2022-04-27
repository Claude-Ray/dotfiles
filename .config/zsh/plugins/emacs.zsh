alias e="emacsclient -n"
alias ee="emacsclient -nc"
alias et="emacsclient -t"

# emacsclient with z command
ez () {
  if [[ "$INSIDE_EMACS" =~ 'vterm' ]]; then
    emacsclient -e "(winum-select-window-1)" &> /dev/null
  fi

  if [ $# -eq 0 ]; then
    emacsclient -n .
  elif [ -f $1 ] || [ -d $1 ]; then
    emacsclient -n $1
  else
    if [[ $1 == *?.?* ]]; then
      read -q "?Open a non-existent file? [Y/n]"
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        emacsclient -n $1
        return
      else
        echo "\nContinue jumping..."
      fi
    fi
    z $1
    rc=$?
    if [ $rc -ne 0 ]; then
      return $rc
    fi
    emacsclient -n .
    cd - &> /dev/null
  fi
}
