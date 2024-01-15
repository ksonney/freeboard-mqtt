# Pull base image
FROM node:latest

RUN apt update && apt upgrade -y
RUN apt install python wget vim
RUN cd /root && \
git clone https://github.com/Freeboard/freeboard.git && \
cd freeboard && \
npm install && \
npm install paho-mqtt

RUN cd /root/freeboard/plugins/ && \
mkdir mqtt && \
cd mqtt && \
wget --output-document mqttws31.js https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.js

RUN cd /root/freeboard/plugins/thirdparty/ && \
git clone https://github.com/alsm/freeboard-mqtt.git

COPY *.json /root/freeboard/
COPY *.html /root/freeboard/

RUN mkdir /freeboard_startup
COPY run_freeboard.sh /freeboard_startup/
RUN chmod +x /freeboard_startup/*

EXPOSE 8080

WORKDIR "/root/freeboard"

ENTRYPOINT ["/freeboard_startup/run_freeboard.sh"]
CMD ["localhost", "8080"]
