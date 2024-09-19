#!/bin/bash

docker run --user $(id -u):$(id -g) -v /:/host wine32:latest bash -c "WINEPREFIX='/host$(pwd)/wine32files' wine '/host$(pwd)/$1'"