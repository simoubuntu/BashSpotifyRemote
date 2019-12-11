#!/bin/sh

miotoken=$(curl -s -H "Authorization: Basic base64code" -d grant_type=refresh_token -d refresh_token=refreshtoken https://accounts.spotify.com/api/token | jq -r '.access_token')

curl -X "PUT" "https://api.spotify.com/v1/me/player/play" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $miotoken"

echo "Spotify Play"
