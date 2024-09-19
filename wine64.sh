#!/bin/bash

docker run -v /:/host wine64:latest bash -c "WINEPREFIX=/host$(pwd)/winefiles wine64 /host$(pwd)/$1"