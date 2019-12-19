#!/bin/sh
#REQUIRES playlist-modify-public and playlist-modify-private

miotoken=$(curl -s -H "Authorization: Basic base64code" -d grant_type=refresh_token -d refresh_token=refreshtoken https://accounts.spotify.com/api/token | jq -r '.access_token')

track=$(curl -X "GET" "https://api.spotify.com/v1/me/player" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $miotoken"| jq -r '.item.uri')

curl -X "POST" "https://api.spotify.com/v1/playlists/playlistURI/tracks?uris=$track" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $miotoken"

echo "Spotify Like"
