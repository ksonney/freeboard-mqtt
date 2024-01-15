#!/bin/bash
echo Executing FREEBOARD "${@:3}"

HOST=$1
PORT=$2

# write out index.html file (backwards since it appends!)
CURRENT_PAGE=index.html
CURRENT_JSON=dashboard.json
echo "If you are not redirected automatically, follow the <a href='http://$HOST:$PORT/index-dev.html?load=$CURRENT_JSON'>link</a>." | cat - /root/freeboard/index.html > /root/freeboard/temp && mv /root/freeboard/temp /root/freeboard/index.html
echo "<title>Page Redirection</title>" | cat - /root/freeboard/$CURRENT_PAGE > /root/freeboard/temp && mv /root/freeboard/temp /root/freeboard/$CURRENT_PAGE
echo "<script>window.location.href = 'http://$HOST:$PORT/index-dev.html?load=$CURRENT_JSON';</script>" | cat - /root/freeboard/$CURRENT_PAGE > /root/freeboard/temp && mv /root/freeboard/temp /root/freeboard/$CURRENT_PAGE
echo "<meta http-equiv='refresh' content='1; url=http://$HOST:$PORT/index-dev.html?load=$CURRENT_JSON'>" | cat - /root/freeboard/$CURRENT_PAGE > /root/freeboard/temp && mv /root/freeboard/temp /root/freeboard/$CURRENT_PAGE
echo "<meta charset='UTF-8'>" | cat - /root/freeboard/$CURRENT_PAGE > /root/freeboard/temp && mv /root/freeboard/temp /root/freeboard/$CURRENT_PAGE
echo "<!DOCTYPE HTML>" | cat - /root/freeboard/$CURRENT_PAGE > /root/freeboard/temp && mv /root/freeboard/temp /root/freeboard/$CURRENT_PAGE

/usr/bin/python -m http.server 8080