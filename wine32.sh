#!/bin/bash

docker run \
    --device /dev/snd \
    -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
    -v /run/user/1000/pulse:/run/user/1000/pulse \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -v /:/host wine32:latest bash \
    -c "useradd -u $(id -u) -g root -m $(whoami) && \
        chown $(id -u):$(id -g) '/host' && \
        chown -R $(id -u):$(id -g) /run/user/1000 && \
        su $(whoami) -c \"WINEPREFIX='/host$(pwd)/wine32files' wine '/host$(pwd)/$1'\""