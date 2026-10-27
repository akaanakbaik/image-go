ARG GO_VERSION=1.27.3
FROM golang:${GO_VERSION}-bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/container \
    GOPATH=/home/container/go \
    GOCACHE=/home/container/.cache/go-build \
    CGO_ENABLED=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       bash ca-certificates curl git openssh-client \
       build-essential pkg-config tini \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -g 1000 container \
    && useradd -u 1000 -g 1000 -d /home/container -s /bin/bash container \
    && mkdir -p /home/container/go /home/container/.cache/go-build \
    && chown -R 1000:1000 /home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

USER 1000:1000

ENTRYPOINT ["/usr/bin/tini", "--", "/bin/bash", "/entrypoint.sh"]
