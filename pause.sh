#!/bin/sh

basecode=$(cat /home/pi/apiremote/basecode.tk)
refresh=$(cat /home/pi/apiremote/refresh.tk)

mytoken=$(curl -s -H "Authorization: Basic $basecode" -d grant_type=refresh_token -d refresh_token=$refresh https://accounts.spotify.com/api/token | jq -r '.access_token')

curl -X "PUT" "https://api.spotify.com/v1/me/player/pause" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $mytoken"

echo "Spotify Pause"

/home/pi/apiremote/checkshuffle.sh $mytoken
