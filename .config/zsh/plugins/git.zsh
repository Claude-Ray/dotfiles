git_checkout_or_create () {
  git checkout $1 2>/dev/null || git checkout -b $1
}
