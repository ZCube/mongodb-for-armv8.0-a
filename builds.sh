#!/bin/bash
docker build . -f Dockerfile.builder -t mongo-builder
./build-v5.sh
./build-v6.sh

