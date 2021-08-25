#!/bin/bash

docker run -it --mount type=bind,source=$(pwd)/share,target=/share -p 5900:5900 --user apps --privileged docker-spnego_spnego-client:latest
