#!/bin/bash

docker run -v /:/host wine64:latest wine /host$(pwd)/$1