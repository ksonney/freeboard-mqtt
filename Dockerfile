# Pull base image
FROM node:latest

RUN apt update && apt upgrade -y
RUN apt install -y python3 wget vim less
RUN cd /root && \
git clone https://github.com/Freeboard/freeboard.git && \
cd freeboard && \
npm install && \
npm install paho-mqtt && \
npm install -g grunt && \
grunt

RUN cd /root/freeboard && \
sed -ie '/^        head.js("js\/freeboard_plugins.min.js",/a         "plugins/thirdparty/clearobject.mqtt.plugin.js",' index.html && \
sed -ie '/^        head.js("js\/freeboard_plugins.min.js",/a         "plugins/thirdparty/paho.mqtt.plugin.js",' index.html

RUN cd /root/freeboard/plugins/ && \
mkdir mqtt && \
cd mqtt && \
wget --output-document mqttws31.js https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.js

RUN cd /root && \
git clone https://github.com/alsm/freeboard-mqtt.git && \
	cp freeboard-mqtt/*.js /root/freeboard/plugins/thirdparty/

COPY *.json /root/freeboard/
# COPY *.html /root/freeboard/

RUN mkdir /freeboard_startup
COPY run_freeboard.sh /freeboard_startup/
RUN chmod +x /freeboard_startup/*

EXPOSE 8080

WORKDIR "/root/freeboard"

ENTRYPOINT ["/freeboard_startup/run_freeboard.sh"]
CMD ["localhost", "8080"]
