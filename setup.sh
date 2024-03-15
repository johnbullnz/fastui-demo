#!/bin/bash

## Setup script for building Docker container image.
if [ "$DEVELOPMENT" == "1" ]
then
    rm -fr /root/app
else
    cd /root/app
    python3 -m pip install .
fi