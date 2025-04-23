#!/bin/sh

CONFIG_FILE="/usr/local/aria2/aria2.conf"
RPC_URL="http://localhost:6800/jsonrpc"
TRACKER_LIST="https://trackerslist.com/all_aria2.txt"

SECRET=$(awk -F= '/^rpc-secret/ {print $2}' $CONFIG_FILE)
TRACKER=$(curl -fsL $TRACKER_LIST)

[[ -n $TRACKER ]] && {
  curl -d '{"id":"1","method":"aria2.changeGlobalOption","params":["token:'$SECRET'",{"bt-tracker":"'$TRACKER'"}]}' $RPC_URL
  sed -i "s@^\(bt-tracker=\).*@\1$TRACKER@" $CONFIG_FILE
}
