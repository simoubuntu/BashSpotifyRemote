#!/bin/sh

basecode=$(cat /home/pi/apiremote/basecode.tk)
refresh=$(cat /home/pi/apiremote/refresh.tk)

mytoken=$(curl -s -H "Authorization: Basic $basecode" -d grant_type=refresh_token -d refresh_token=$refresh https://accounts.spotify.com/api/token | jq -r '.access_token')

state=$(curl -X "GET" "https://api.spotify.com/v1/me/player" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $mytoken"| jq -r '.shuffle_state')

echo "Spotify dice $state"

if [ $state = 'true' ]
then
	curl -X "PUT" "https://api.spotify.com/v1/me/player/shuffle?state=false" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $mytoken"
else
	curl -X "PUT" "https://api.spotify.com/v1/me/player/shuffle?state=true" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $mytoken"
fi

echo "Spotify Shuffle"

/home/pi/apiremote/checkshuffle.sh $mytoken
