#!/bin/sh

# mkpasswd is a tool in the whois package of Debian and Ubuntu

myname=`basename $0`

mkpasswd=`which mkpasswd`

if [ "$?" -ne "0" ]; then
  echo "$myname: mkpasswd(1) not found" 1>&2;
  exit 2;
fi

mkpasswd -m sha-512
