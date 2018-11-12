#!/bin/bash

rm -rf rootfs
docker build -f DockerfileCI -t rootfs . --no-cache
id=$(docker create rootfs true)
mkdir rootfs
docker export "$id" | tar -x -C rootfs
docker rm -vf "$id"
docker rmi rootfs
