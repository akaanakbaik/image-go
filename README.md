# Universal Go Docker Images

Multi-architecture Go Docker images for Pterodactyl.

## Supported versions

| Go series | Version | Tag |
|---|---|---|
| 1.27 | 1.27.3 | go_1.27 |
| 1.26 | 1.26.10 | go_1.26 |
| 1.25 | 1.25.14 | go_1.25 |
| 1.24 | 1.24.13 | go_1.24 |
| 1.23 | 1.23.12 | go_1.23 |

Each version also has an exact patch tag.
The `go_latest` alias points to Go 1.27.3.

Registry: ghcr.io/akaanakbaik/image-go

Architectures: linux/amd64, linux/arm64

## Pterodactyl

Working directory: /home/container

Container UID/GID: 1000

Example startup commands:

- go run main.go
- go run .
- go build -o app . && ./app
- ./app

## Features

Go compiler, Go Modules, CGO, GCC, Git, curl,
OpenSSH client, Bash, and tini.

Go versions are pinned in go-versions.json.
Updating that file and pushing to master triggers CI/CD.
