#!/bin/bash
set -e

cp "$TARBALL_PATH" Docker/DockerMediawiki/mediawiki.tar.gz
echo "Building mediawiki $MEDIAWIKI_VERSION"
docker build \
    --build-arg=MEDIAWIKI_MAJOR_VERSION=$MEDIAWIKI_MAJOR_VERSION \
    --build-arg=MEDIAWIKI_VERSION=$MEDIAWIKI_VERSION \
    Docker/DockerMediawiki/ -t "$1"

docker save "$1" | gzip -9f > "$(pwd)"/artifacts/"$1".docker.tar.gz