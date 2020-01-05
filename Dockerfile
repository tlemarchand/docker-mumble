FROM debian:buster-slim

RUN apt-get update && apt-get install -y mumble-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 64738/tcp
EXPOSE 64738/udp

VOLUME ["/var/lib/mumble-server"]

USER mumble-server

ENTRYPOINT ["/usr/sbin/murmurd"]
CMD ["-fg", "-ini", "/etc/mumble-server.ini"]
