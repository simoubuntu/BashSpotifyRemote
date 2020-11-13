#!/bin/sh

state=$(curl -X "GET" "https://api.spotify.com/v1/me/player" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $1"| jq -r '.shuffle_state')

echo "Spotify says $state"

if [ $state = 'true' ]
then
	echo 1 > /sys/class/gpio/gpio4/value
else
	echo 0 > /sys/class/gpio/gpio4/value
fi
