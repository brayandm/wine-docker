#!/bin/bash

docker run -v /:/host wine32:latest wine /host$(pwd)/$1