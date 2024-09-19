#!/bin/bash

docker run \
    --user $(id -u):$(id -g) \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -v /:/host wine32:latest bash \
    -c "WINEPREFIX='/host$(pwd)/wine32files' wine '/host$(pwd)/$1'"