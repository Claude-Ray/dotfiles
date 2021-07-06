alias e="emacsclient -n"
alias ee="emacsclient -nc"
alias et="emacsclient -t"

# emacsclient with z command
ez () {
  if [ $# -eq 0 ]; then
    emacsclient -n .
  elif [ -f $1 ] || [ -d $1 ]; then
    emacsclient -n $1
  else
    z $1
    emacsclient -n .
    cd - &> /dev/null
  fi
}
