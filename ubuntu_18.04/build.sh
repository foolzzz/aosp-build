#!/bin/bash


# docker build --build-arg userid=$(id -u) --build-arg groupid=$(id -g) --build-arg username=$(id -un) -t android-build-trusty .


userid="1001"
groupid="1001"
username="tom"

set -x

docker build --build-arg userid=$userid --build-arg groupid=$groupid --build-arg username=$username -t android-build-bionic .

