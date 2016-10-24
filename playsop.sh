#!/bin/bash
# current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PLAYERTV="mpv --quiet --idle=yes --audio-device=pulse/alsa_output.pci-0000_00_03.0.hdmi-stereo"
PLAYERNB="mpv --quiet --idle=yes"

./sp-sc-auth sop://broker.sopcast.com:3912/$1 3908 8908 &

_PID=$!

n=0
until [ $n -ge 10 ]; do
    # is sp-auth died, exit
    ps | grep -q $_PID || exit 1

    netstat -vant | grep 8908 | grep -q LISTEN  && break
    n=$[n+1]
    sleep 1
done

$PLAYERTV http://localhost:8908/tv.asf
