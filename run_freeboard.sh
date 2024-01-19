#!/bin/bash
echo Executing FREEBOARD "${@:3}"

HOST=$1
PORT=$2

/usr/bin/python3 -m http.server 8080