#!/bin/sh

tracker=$(curl -sL https://trackerslist.com/all_aria2.txt)

key=password

[ -n $tracker ] && {
  curl -d '{"id":"1","method":"aria2.changeGlobalOption","params":["token:'$key'",{"bt-tracker":"'$tracker'"}]}' http://localhost:6800/jsonrpc
  sed -i "s@^\(bt-tracker=\).*@\1$tracker@" /home/data/aria2/aria2.conf
}
