#!/usr/bin/env bash
# Requires docker 17.05 or higher

set -e

echo ""
echo "================================="
echo "  Building brweb docker image   "
echo "================================="
echo ""


IMAGE_NAME=jholdstock/brweb

if [ "$1" != "" ]; then
    IMAGE_NAME=$1
fi

docker build --build-arg HUGO_BASEURL=http://localhost:1234 -t $IMAGE_NAME  .

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
echo "You can now run brweb with the following command:"
echo "    docker run -d --rm -p <local port>:80 jholdstock/brweb:latest"
echo ""
