# BashSpotifyRemote
*A bunch of simple bash scripts to remote control Spotify playback*

The purpose of this bunch of scripts is to control the playback on a device that uses Spotify.

The choice of using simple, independent bash scripts is justified by the ease of integrating these files with other services, for example Lirc.

## Installation
To use these scripts you will need to register an App on [Spotify for Developers](https://developer.spotify.com/).
I wrote a [simple guide](https://parerinonrichiesti.blogspot.com/2019/12/spotify-web-api.html), but at the moment is only in Italian.

With the app registered, you are able to obtain the `Client ID` and the `Client Secret`. Combine those as

    clientID:clientSecret

and use [this site](https://www.base64encode.org/) to convert them in Base64 format. Then save the code in a file called `basecode.tk` and place it in the same folder of the scripts.

Then you need a refresh token. The procedure to obtain that is explained [in my blog](https://parerinonrichiesti.blogspot.com/2019/12/spotify-web-api.html) (English version coming soon, I hope!)
Save it in `refresh.tk`

All the paths in the scripts are absolute and refer to a folder called `apiremote` in the home folder of pi user. If you place them in another folder you have to edit those paths (I'm sorry!).

To use the *Transfer Here* function you have to save the target device id in a file called `deviceid.tk` placed in the same folder.

These scripts are a very useful to use a remote to control [Raspotify](https://github.com/dtcooper/raspotify).
