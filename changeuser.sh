#!/bin/sh

echo "base64code" > /home/pi/apiremote/basecode.tk
echo "refreshcode" > /home/pi/apiremote/refresh.tk

basecode=$(cat /home/pi/apiremote/basecode.tk)
refresh=$(cat /home/pi/apiremote/refresh.tk)

mytoken=$(curl -s -H "Authorization: Basic $basecode" -d grant_type=refresh_token -d refresh_token=$refresh https://accounts.spotify.com/api/token | jq -r '.access_token')

echo "User changed"

/home/pi/apiremote/checkshuffle.sh $mytoken
