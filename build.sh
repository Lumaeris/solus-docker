#!/bin/bash
set -e

mkdir -p ./solus
mount ./solus_image/rootfs.img ./solus
docker build -t ghcr.io/lumaeris/solus-base:latest .
umount ./solus
