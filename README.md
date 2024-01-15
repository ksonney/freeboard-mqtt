# freeboard_mqtt

[![Docker Pulls](https://img.shields.io/docker/pulls/ksonney/freeboard-mqtt.svg)](https://hub.docker.com/r/ksonney/freeboard-mqtt/)
[![Docker Stars](https://img.shields.io/docker/stars/ksonney/freeboard-mqtt.svg)](https://hub.docker.com/r/ksonney/freeboard-mqtt/)

Container responsible for running a freeboard instance with installed MQTT plugins

### Quick summary ###

Configured `Makefile` allows quick build and push of `ksonney/freeboard-mqtt` image on [DockerHub](https://hub.docker.com). Also 
see `Dockerfile` for included files and scripts.

### Deployment instructions ###

This is not an automatically and publicly built repo. So for example, to run this you would do:

```
$ docker run -p 8080:8080 --restart=always ksonney/freeboard-mqtt &
```

This will automatically start a python `SimpleHTTPServer` on port `8080`.

If you plan on putting this for open access on a server, then you will probably consider running on a privileged port. In the following example, our server has the '192.34.58.129' ip:

```
docker run --rm -p 80:8080 ksonney/freeboard_mqtt 192.34.58.129 80 &
```
