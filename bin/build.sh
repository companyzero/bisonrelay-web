#!/usr/bin/env bash
# Requires docker 17.05 or higher

set -e

echo ""
echo "========================================="
echo "  Building bisonrelay-web docker image   "
echo "========================================="
echo ""


IMAGE_NAME=companyzero/bisonrelay-web

if [ "$1" != "" ]; then
    IMAGE_NAME=$1
fi

docker build --build-arg HUGO_BASEURL=https://bisonrelay.org -t $IMAGE_NAME  .

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
echo "You can now run bisonrelay-web with the following command:"
echo "    docker run -d --rm -p <local port>:80 companyzero/bisonrelay-web:latest"
echo ""
