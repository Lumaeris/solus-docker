#!/bin/sh
set -e

# all hardcoded for now

FILE="https://downloads.getsol.us/isos/2025-01-26/Solus-Budgie-Release-2025-01-26.iso"

{
    echo "Downloading image $FILE"
    curl $FILE -o ./solus.iso
    mkdir ./solus_image
    mkdir ./solus_mnt
    mkdir ./solus_mntiso
    mount -o ro ./solus.iso ./solus_mntiso
    mount -o ro ./solus_mntiso/LiveOS/squashfs.img ./solus_mnt
    cp ./solus_mnt/LiveOS/rootfs.img ./solus_image
    umount ./solus_mnt ./solus_mntiso
    rm -rf ./solus_mnt
    rm -rf ./solus_mntiso
    rm ./solus.iso
} >&2

# Output the downloaded version for github actions to tag the images
echo "BUILD_ID=2025-01-26"
FULL_VERSION="4.7"
echo "FULL_VERSION=${FULL_VERSION}"
echo "MAJOR_VERSION=$(echo "$FULL_VERSION" | cut -d. -f 1)"
