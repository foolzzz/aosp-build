#!/bin/bash

set -x

# docker build --build-arg userid=$(id -u) --build-arg groupid=$(id -g) --build-arg username=$(id -un) -t android-build-bionic .
docker build --build-arg userid=1000 --build-arg groupid=1000 --build-arg username=ubuntu -t android-build-bionic .
