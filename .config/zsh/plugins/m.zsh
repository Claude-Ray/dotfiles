m () {
  if [ $# -gt 0 ]; then
    $* --help | less
  fi
}
