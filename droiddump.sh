#!/bin/bash

IP="10.1.10.107"
PORT="2222"
DESTINATION="$HOME/zulu"

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
            echo "Usage: [ -i IP ] [ -p PORT ] [-d DESTINATION]"
            exit 0
            ;;
    esac
done

PATHS=(
    "/storage/C3A8-B19A/DCIM/"
    "/storage/C3A8-B19A/Android/data/net.osmand.plus"
    "/storage/C3A8-B19A/Android/data/com.arachnoid.sshelper"
    "/sdcard/Android/data/com.mendhak.gpslogger"
    "/sdcard/Android/data/kvj.taskw"
    "/sdcard/com.fsck.k9"
    "/sdcard/bcnav"
    "/sdcard/brouter"
)

for path in "${PATHS[@]}"
do
    rsync -e "ssh -p $PORT" -azvL --no-perms --no-times --size-only --progress "$IP:$path" "$DESTINATION"
done
