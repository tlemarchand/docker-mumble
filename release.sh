#!/bin/bash
git checkout master
podman run debian:bullseye-slim /bin/bash -c "apt-get update > /dev/null && apt-cache policy mumble-server | sed -n -e 's/^.*Candidate: //p' | tr -d '\n'" > version
git add -A
git commit -m `cat version`
git push origin master
git tag `cat version`
git push origin `cat version`