#!/bin/bash

#usage info
if [[ ($# -ne 1) || ($1 != 'disable' && $1 != 'enable') ]];
then
  echo "Usage $(basename $0) [disable|enable]" >&2
  exit 1
fi

#important variables
port=8080
server="my_server"
username="my_username"

#enable proxy
enable_socks() {
  echo "Connecting to $server on $port"
  ssh -D $port -f -C -q -N $username@$server
  echo $! > .socks_data
  networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 $port
  networksetup -setsocksfirewallproxystate Wi-Fi on
  echo "SOCKS proxy enabled."
}

#disable proxy
disable_socks() {
  networksetup -setsocksfirewallproxystate Wi-Fi off
  echo "SOCKS proxy disabled."
  kill -9 $(cat .socks_data /dev/null 2>&1) > /dev/null 2>&1
}

#main program options
if [ $1 = 'enable' ]; 
then
  enable_socks
else 
  disable_socks
fi
