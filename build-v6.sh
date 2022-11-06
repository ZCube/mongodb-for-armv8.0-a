#!/bin/bash
export VERSION_MAJOR=v6
export VERSION=6.0.2
docker run --rm -ti --log-driver none --cpus=3.5 -e VERSION_MAJOR -e VERSION -v ${PWD}/mongo-${VERSION_MAJOR}:/opt/work -v ${PWD}/build.sh:/opt/work/build.sh -w /opt/work mongo-builder ./build.sh
tar -czvf mongo-v${VERSION}.tar.gz -C mongo-${VERSION_MAJOR}/mongo/build/install .

