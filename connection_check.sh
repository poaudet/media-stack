#You may change the host by adding an argument to the command
#i.e.: sh connection_check.sh 192.168.1.1
if [ -z $1 ];
then echo "Testing on localhost..."
     host=localhost
else echo "Testing on $1..."
     host=$1
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:9117) == 301 ];
then echo "Connection successfull to Jackett"
else echo "WARNING! Connection failed to Jackett"
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:8191) == 200 ];
then echo "Connection successfull to Flaresolverr"
else echo "WARNING! Connection failed to Flaresolverr"
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:7878) == 200 ];
then echo "Connection successfull to Radarr"
else echo "WARNING! Connection failed to Radarr"
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:8989) == 200 ];
then echo "Connection successfull to Sonarr"
else echo "WARNING! Connection failed to Sonarr"
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:32400) == 200 ];
then echo "Connection successfull to Plex"
else echo "WARNING! Connection failed to Plex"
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:9091) == 301 ];
then echo "Connection successfull to Torrent"
else echo "WARNING! Connection failed to Torrent"
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:8080) == 20 ];
then echo "Connection successfull to Calibre"
else echo "WARNING! Connection failed to Calibre"
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:8083) == 302 ];
then echo "Connection successfull to Calibre-Web"
else echo "WARNING! Connection failed to Calibre-WEb"
fi
if [ $(curl -o /dev/null -s -w "%{http_code}\n" $host:8787) == 200 ];
then echo "Connection successfull to Readarr"
else echo "WARNING! Connection failed to Readarr"
fi