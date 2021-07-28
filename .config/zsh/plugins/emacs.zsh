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
    rc=$?
	  if [ $rc -ne 0 ]; then
      return $rc
    fi
    emacsclient -n .
    cd - &> /dev/null
  fi
}
