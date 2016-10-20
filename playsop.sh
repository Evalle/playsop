#!/bin/bash

PLAYER="mpv --quiet --idle=yes"

URL=$1

# TO-DO - check that sp-sc-auth exists

./sp-sc-auth $URL 3908 8908 >/dev/null &

_PID=$!

cleanup () {
    ps | grep -q $_PID && kill $_PID
    exit
}

trap cleanup SIGINT SIGTERM EXIT

# Wait up to 10 seconds to connect
n=0
until [ $n -ge 10 ]; do
    # if sp-auth died, exit
    ps | grep -q $_PID || exit 1

    netstat -vant | grep 8908 | grep -q LISTEN && break
    n=$[$n+1]
    sleep 1
done

$PLAYER http://localhost:8908/tv.asf
