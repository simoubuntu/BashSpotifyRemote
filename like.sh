#!/bin/sh
#REQUIRES playlist-modify-public and playlist-modify-private

basecode=$(cat /home/pi/apiremote/basecode.tk)
refresh=$(cat /home/pi/apiremote/refresh.tk)

mytoken=$(curl -s -H "Authorization: Basic $basecode" -d grant_type=refresh_token -d refresh_token=$refresh https://accounts.spotify.com/api/token | jq -r '.access_token')

track=$(curl -X "GET" "https://api.spotify.com/v1/me/player" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $mytoken"| jq -r '.item.uri')

echo "Spotify says $track"

curl -X "POST" "https://api.spotify.com/v1/playlists/1AMZ394W3u1slxX1FYvBZ4/tracks?uris=$track" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $mytoken"

echo "Spotify Like"