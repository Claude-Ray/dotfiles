m () {
  if [ $# -gt 0 ] && command -v $1 &> /dev/null; then
    $* --help | less
  fi
}
