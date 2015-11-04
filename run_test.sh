#!/bin/bash

set -ue
IMAGE_NAME01="build-args-normal"
IMAGE_NAME02="build-args-add"
docker images --quiet --all ${IMAGE_NAME01}| xargs -r docker rmi >/dev/null
docker images --quiet --all ${IMAGE_NAME02}| xargs -r docker rmi >/dev/null
echo "[[NORMAL]]"
set -x
docker build --no-cache -t ${IMAGE_NAME01} .
docker run --rm ${IMAGE_NAME01} id 
set +x
echo 
echo "[[ADD BUILD ARGS]]"
set -x
docker build --no-cache -t ${IMAGE_NAME02} --build-arg=user="apache" .
docker run --rm ${IMAGE_NAME02} id 
set +x
