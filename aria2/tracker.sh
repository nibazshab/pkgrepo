#!/bin/sh

file="/home/data/aria2/aria2.conf"
url=http://localhost:6800/jsonrpc

tracker=$(curl -sL https://trackerslist.com/all_aria2.txt)
secret="$(awk -F= '/^rpc-secret/ {print $2}' $file)"

[ -n $tracker ] && {
  curl -d '{"id":"1","method":"aria2.changeGlobalOption","params":["token:'$secret'",{"bt-tracker":"'$tracker'"}]}' $url
  sed -i "s@^\(bt-tracker=\).*@\1$tracker@" $file
}
