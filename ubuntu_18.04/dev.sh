#!/bin/bash

docker run -itd --name aospdev -v `pwd`:/src android-build-bionic /bin/bash
