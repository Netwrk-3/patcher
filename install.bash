#!/bin/bash

check_priv()
{
  if [ "$(id -u)" -ne 0 ]; then
    err "you must be root"
  fi
}

main() {
	check_priv
	cd src && chmod +x patcher && cp ./patcher /usr/local/bin
}

main
