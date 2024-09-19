#!/bin/bash

docker run --user $(id -u):$(id -g) -v /:/host wine64:latest bash -c "WINEPREFIX='/host$(pwd)/wine64files' wine64 '/host$(pwd)/$1'"