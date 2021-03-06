#!/bin/bash
set -e

cp "$TARBALL_PATH" Docker/build/Mediawiki/mediawiki.tar.gz

echo "Building mediawiki $MEDIAWIKI_VERSION"
docker build \
    --build-arg=PHP_VERSION="$PHP_VERSION" \
    --build-arg=MEDIAWIKI_MAJOR_VERSION="$MEDIAWIKI_MAJOR_VERSION" \
    --build-arg=MEDIAWIKI_VERSION="$MEDIAWIKI_VERSION" \
    Docker/build/Mediawiki/ -t "$1"

docker save "$1" | gzip -"$GZIP_COMPRESSION_RATE"f > "$(pwd)"/artifacts/mediawiki.docker.tar.gz