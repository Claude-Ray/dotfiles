proxy_on () {
  export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
  if (( $# > 0 )); then
    local proxy=$1
    export http_proxy=$proxy
    export https_proxy=$proxy
    # export ftp_proxy=$proxy
    # export rsync_proxy=$proxy
    # echo "Proxy environment variable set."
    return 0
  else
    echo "Invalid address"
    return 1
  fi
}

function proxy_off () {
  unset http_proxy https_proxy ftp_proxy rsync_proxy \
        HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
  echo -e "Proxy environment variable removed."
}
