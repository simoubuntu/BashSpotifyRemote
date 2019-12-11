#!/bin/sh

miotoken=$(curl -s -H "Authorization: Basic base64code" -d grant_type=refresh_token -d refresh_token=refreshtoken https://accounts.spotify.com/api/token | jq -r '.access_token')

state=$(curl -X "GET" "https://api.spotify.com/v1/me/player" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $miotoken"| jq -r '.shuffle_state')

if [ $state = 'true' ]
then
	curl -X "PUT" "https://api.spotify.com/v1/me/player/shuffle?state=false" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $miotoken"
else
	curl -X "PUT" "https://api.spotify.com/v1/me/player/shuffle?state=true" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $miotoken"
fi

echo "Spotify Shuffle"
