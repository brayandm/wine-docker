#!/bin/bash

docker run \
    --device /dev/snd \
    -e PULSE_SERVER=unix:/run/user/$(id -u)/pulse/native \
    -v /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -v /:/host wine32:latest bash \
    -c "useradd -u $(id -u) -g root -m $(whoami) && \
        chown $(id -u):$(id -g) '/host/home/brayand/Storage/Games' && \
        chown -R $(id -u):$(id -g) /run/user/$(id -u) && \
        su $(whoami) -c \"WINEPREFIX='/host$(pwd)/wine32files' wine '/host$(pwd)/$1'\""