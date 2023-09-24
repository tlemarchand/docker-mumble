#!/bin/bash
git checkout master
podman run debian:bookworm-slim /bin/bash -c "apt-get update > /dev/null && apt-cache policy mumble-server | sed -n -e 's/^.*Candidate: //p' | tr -d '\n'" > version
git add -A
git commit -m "Version update"
git push origin master
git tag -f `cat version`
git push origin -f `cat version`
