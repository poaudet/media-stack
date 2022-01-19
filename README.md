# Docker Containers Media Stack

Simple docker-compose file to setup a basic media center including library management, torrenting and streaming.

Featured in my blog post on [Hashtag-Innovation](https://hashtag-innovation.com)

## Description

This stack include everything needed to download torrent over VPN, manage movies and series libraries and stream your content over your network and beyond.

It setup a common network for all containers and expose ports to host for easy access.

These image are use:
* [Haugene/transmission-openvpn](https://github.com/haugene/docker-transmission-openvpn)
* [Linuxserver.io/Radarr](https://github.com/linuxserver/docker-radarr)
* [Linuxserver.io/Sonarr](https://github.com/linuxserver/docker-sonarr)
* [Linuxserver.io/Jackett](https://github.com/linuxserver/docker-jackett)
* [Linuxserver.io/Calibre](https://github.com/linuxserver/docker-calibre)
* [Linuxserver.io/Calibre-Web](https://github.com/linuxserver/docker-calibre-web)
* [Linuxserver.io/Readarr](https://github.com/linuxserver/docker-readarr)
* [Flaresolverr/Flaresolverr](https://github.com//FlareSolverr/FlareSolverr)
* [Plexinc/pms-docker](https://github.com/plexinc/pms-docker)

See each specific repository to get more configuration options that you can include in the envrionment variables.

## Getting Started

### Dependencies
Tested on:
* Docker Engine 20.10
* Docker-compose 1.29.2

### Installing

<details><summary>Method: Portainer Stack (Recommended)</summary>
<p>

1. Install Portainer or Portainer Agent. If it's your first or single docker server, you must have Portainer first. Agent alone is not enough

* [Portainer/Portainer-CE](https://github.com/portainer/portainer/)
* [Portainer/Portainer-Agent](https://github.com/portainer/agent)

2. Enter your Portainer Web and select your environmnent

3. Click on stack, then add stack

4. Select **Use a git repository**

5. Name your stack

6. Set the Repository URL to https://github.com/poaudet/media-stack.git

7. Download the [.env-sample](.env-sample) and rename it to *.env*

8. Back to Portainer, click **Load variables from .env file** and select to file you just rename

9. Edit variables to suit your needs

10. Deploy stack!

</p>
</details>

<details><summary>Method: CLI</summary>
<p>

1. Check your docker and docker-compose version
```ShellSession
$ docker-compose -v && docker -v
```

See above for required version and update if needed.

Links to official documentation
- [Get Docker](https://docs.docker.com/get-docker/)
- [Get Docker-compose](https://docs.docker.com/compose/install/)

Or... you may give a try with your package manager.

e.g. for Ubuntu
```ShellSession
$ apt update
$ apt install docker-ce docker-ce-cli containerd.io docker-compose
```
2. Clone this repository on your host
```ShellSession
$ git clone https://github.com/poaudet/media-stack.git
```
3. Edit the file .env-sample for your needs and save it to .env **in the same folder of docker-compose.yml**

4. Edit the file docker-compose.yml for any specific configurations. All required modification are commented so the next step won't work
i.e. this:
```yaml
volumes:
      - #/path/to/your/download:/data
```
Should be something like this, where pepito is your username:
```yaml
volumes:
      - /home/pepito/downloads:/data
```
5. Run the image
```Shell
$ docker-compose up -d
```
6. Test if everything is up and running
```Shell
$ docker ps
```
You should get the list of your running container, including six new ones!

```Shell
$ curl -I host:port
```
Where host maybe localhost if you keep the port expose in the docker-compose.yml.
Port should be the one of the service you are checking.

You should get this as your first line
```
HTTP/1.1 301 Moved Permanently 
#Or HTTP/1.1 200 Moved Permanently
...
```

You can also use the helper script *connection_check.sh*
```ShellSession
$ sh connection_check.sh [ip address of the host/localhost if omitted]
```

You should get this:
```
Testing on localhost...
Connection successfull to Jackett
Connection successfull to Flaresolverr
Connection successfull to Radarr
Connection successfull to Sonarr
Connection successfull to Plex
Connection successfull to Torrent
...
```

7. Enjoy! :)
</p>
</details>

### Executing program

Everything is running!

You may now access your app through either localhost:port or your container ip address:port

Like [http://localhost:9117](http://localhost:9117) for Jackett (or [http://172.18.0.2:9117](http://172.18.0.2:9117) for the container ip address)

## Help

Don't hesitate to open a thread or contact me!

## Author

- Mail: [poaudet](mailto://pier-olivier.audet@hashtag-innovation.com)
- Blog: [Hashtag-Innovation](https://hashtag-innovation.com)

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) for details

## Acknowledgments

README based on [this](https://gist.github.com/DomPizzie/7a5ff55ffa9081f2de27c315f5018afc)
