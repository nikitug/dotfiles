#!/bin/bash

function ips {
  ifconfig | grep "inet " | awk '{ print $2 }'
}

function public_ip {
  res=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
  echo "$res"
}

# Checks for existence of a command
command_exists () {
  type "$1" &> /dev/null ;
}
