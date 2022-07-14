nvm_migrate () {
  local node_version=$1

  # Filter out the built-in packages: npm, corepack
  local npm_global_packages=$(npm ls -g --depth=0 -p | awk -F 'node_modules/' '{print $2}' | grep . | grep -vxF npm | grep -vxF corepack | tr '\n' ' ')

  # Eval real nvm instead of alias
  eval 'nvm install -b $node_version'

  # Expand package list string to array
  local packages_array=(${(@s: :)npm_global_packages})
  npm i -g $packages_array

  eval 'nvm use $node_version'
}
