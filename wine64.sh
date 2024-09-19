#!/bin/bash

docker run --user $(id -u):$(id -g) -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v /:/host wine64:latest bash -c "WINEPREFIX='/host$(pwd)/wine64files' wine64 '/host$(pwd)/$1'"