#!/bin/sh
# You may change the host by adding an argument to the command
# i.e.: sh connection_check.sh 192.168.1.1

if [ -z "$1" ]; then 
    echo "Testing on localhost..."
    host="localhost"
else 
    echo "Testing on $1..."
    host="$1"
fi

check_service() {
    port=$1
    expected_code=$2
    service_name=$3

    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$host:$port")
    
    if [ "$http_code" -eq "$expected_code" ]; then
        echo "Connection successful to $service_name"
    else
        echo "WARNING! Connection failed to $service_name (Expected $expected_code, got $http_code)"
    fi
}

check_service 9696 200 "Prowlarr"  # Replaced Jackett (9117) with Prowlarr (9696)
check_service 8191 200 "Flaresolverr"
check_service 7878 200 "Radarr"
check_service 8989 200 "Sonarr"
check_service 32400 200 "Plex"
check_service 9091 200 "Torrent"
check_service 8080 200 "Calibre"
check_service 8083 302 "Calibre-Web"
check_service 8787 200 "Readarr"
