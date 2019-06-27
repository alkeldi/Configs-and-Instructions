#!/bin/bash

#usage info
if [[ ($# -ne 1) || ($1 != 'disable' && $1 != 'enable') ]];
then
  echo "Usage: $(basename $0) [disable|enable]" >&2
  exit 1
fi

#important variables
port=8080
server="my_server"
username="my_username"
ssh_command="ssh -D $port -f -C -q -N $username@$server"

#enable proxy
enable_socks() {

  #check if enabled
  ssh_process=$(ps aux | pgrep -f "$ssh_command")
  if [ ! -z "$ssh_process" ];
  then 
    echo "Error: SOCKS is already enabled."
    exit 1
  fi

  echo "Connecting to $server on $port"
  $ssh_command
  networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 $port
  networksetup -setsocksfirewallproxystate Wi-Fi on
  echo "SOCKS proxy enabled."
}

#disable proxy
disable_socks() {
  networksetup -setsocksfirewallproxystate Wi-Fi off
  echo "SOCKS proxy disabled."
  ssh_process=$(ps aux | pgrep -f "$ssh_command")
  if [ ! -z "$ssh_process" ];
  then
    kill -9 $ssh_process
  fi
}

#main program options
if [ $1 = 'enable' ]; 
then
  enable_socks
else 
  disable_socks
fi
