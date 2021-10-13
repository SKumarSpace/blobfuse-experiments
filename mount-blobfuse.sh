#!/bin/sh
echo Initializing
mkdir -p /blobs
blobfuse /blobs  --container-name=upload-2 --tmp-path=/mnt/resource/blobfusetmp -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120
tail -f /dev/null