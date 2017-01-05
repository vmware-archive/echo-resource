#!/bin/bash
outtar=./rootfs.tar
if [[ -n $1 ]]; then
  outtar=$1
fi

imageid=$(docker build . -q)
containerid=$(docker run -id $imageid sh)

docker export $containerid -o $outtar
docker rm -f $containerid
