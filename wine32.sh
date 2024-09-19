#!/bin/bash

docker run -v /:/host wine32:latest bash -c "WINEPREFIX=/host$(pwd)/winefiles wine /host$(pwd)/$1"