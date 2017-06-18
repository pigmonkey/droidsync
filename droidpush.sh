#!/bin/bash

IP="10.1.10.107"
PORT="2222"
DESTINATION="/storage/C3A8-B19A/Android/data/com.arachnoid.sshelper/"

while getopts "i:p:d:h" opt; do
    case $opt in
        i)
            IP="$OPTARG"
            ;;
        p)
            PORT=$OPTARG
            ;;
        d)
            DESTINATION=$OPTARG
            ;;
        h)
            echo "Usage: [ -i IP ] [ -p PORT ] [-d DESTINATION] [PATH]"
            exit 0
            ;;
    esac
done

rsync -e "ssh -p $PORT" -azvL --no-perms --no-times --size-only --progress --delete "$1" "$IP:$DESTINATION"
