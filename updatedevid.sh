#!/bin/sh

basecode=$(cat /home/pi/apiremote/basecode.tk)
refresh=$(cat /home/pi/apiremote/refresh.tk)

miotoken=$(curl -s -H "Authorization: Basic $basecode" -d grant_type=refresh_token -d refresh_token=$refresh https://accounts.spotify.com/api/token | jq -r '.access_token')

curl -X "GET" "https://api.spotify.com/v1/me/player/devices" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $miotoken"
