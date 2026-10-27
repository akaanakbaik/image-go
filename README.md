# Go Docker Images

Universal Go toolchain images for compiling and running Go applications.

**Repository:** [akaanakbaik/image-go](https://github.com/akaanakbaik/image-go)

**Container registry:** `ghcr.io/akaanakbaik/image-go`

**GitHub Actions:** [https://github.com/akaanakbaik/image-go/actions](https://github.com/akaanakbaik/image-go/actions)

## Available images

| Runtime version | Image | Additional tag |
|---|---|---|
| 1.27.3 | `ghcr.io/akaanakbaik/image-go:go_1.27` | `ghcr.io/akaanakbaik/image-go:go_1.27.3` |
| 1.26.10 | `ghcr.io/akaanakbaik/image-go:go_1.26` | `ghcr.io/akaanakbaik/image-go:go_1.26.10` |
| 1.25.14 | `ghcr.io/akaanakbaik/image-go:go_1.25` | `ghcr.io/akaanakbaik/image-go:go_1.25.14` |
| 1.24.13 | `ghcr.io/akaanakbaik/image-go:go_1.24` | `ghcr.io/akaanakbaik/image-go:go_1.24.13` |
| 1.23.12 | `ghcr.io/akaanakbaik/image-go:go_1.23` | `ghcr.io/akaanakbaik/image-go:go_1.23.12` |
| Latest alias | `ghcr.io/akaanakbaik/image-go:go_latest` | Points to 1.27.3 in this release |

Go patch versions are recorded in `go-versions.json`.


## Supported platforms

- `linux/amd64` — x86-64 servers
- `linux/arm64` — ARM64 servers

Images are built through GitHub Actions using Docker Buildx.
Platform support describes the configured build targets; consult the published manifest for confirmation.

## Quick start with Docker

```bash
docker pull ghcr.io/akaanakbaik/image-go:go_1.27
docker run --rm ghcr.io/akaanakbaik/image-go:go_1.27
```

Run an application from the current directory:

```bash
docker run --rm -v "$PWD:/home/container" \
  -e STARTUP="go run ." \
  ghcr.io/akaanakbaik/image-go:go_1.27
```

## Pterodactyl setup

1. Open the Pterodactyl administrator panel.
2. Edit the relevant Egg's Docker image list.
3. Add one of the image URLs from the table above.
4. Configure the Egg startup command for your application.
5. Select the image for the server and restart or reinstall as appropriate.

The image alone does not replace a Pterodactyl Egg.
The Egg must provide a compatible startup configuration and installation procedure.

### Startup examples

```bash
go run .
go run main.go
go build -o app . && ./app
```

Choose **one** startup command appropriate to your application.
For Pterodactyl, set the `STARTUP` environment variable if required by the image's entrypoint.

## Working directory and permissions

- Application working directory: `/home/container`.
- Application files should be stored in a persistent Pterodactyl volume.
- Avoid running applications as root.
- Ensure mounted files are writable by the container user.

## Environment variables

| Variable | Purpose |
|---|---|
| `STARTUP` | Shell command executed by the container entrypoint, when supported |
| Application-specific variables | Configure your bot, API, or service |

Do not commit credentials, API tokens, or passwords to the repository.
Pass secrets through the server's protected environment settings.

## CI/CD

The GitHub Actions workflow builds and tests runtime images.
Successful publishing jobs push images to GitHub Container Registry.

Typical workflow:

1. Update runtime versions or image configuration.
2. Commit and push to `master`.
3. Wait for GitHub Actions tests.
4. Publish the multiarchitecture image.
5. Confirm the required tag is available before production deployment.

## Security and maintenance

- Prefer maintained runtime versions for production.
- Older versions may no longer receive upstream security fixes.
- Pin an exact image digest when reproducibility is required.
- Image tags may be republished after dependency or base-image updates.
- Rebuild images when upstream security patches become available.
- Review third-party dependencies and application packages separately.
- Use least-privilege container settings and appropriate resource limits.
- Avoid exposing unnecessary ports or sensitive files.

## Limitations

- These are runtime/toolchain images, not complete application templates.
- Application dependencies and startup configuration remain your responsibility.
- A successful image build does not guarantee compatibility with every Egg.
- Published GHCR package visibility may require configuration to allow anonymous pulls.
- Runtime-specific behavior can differ across versions and CPU architectures.

## Troubleshooting

If a server does not start:

1. Confirm the selected image tag exists.
2. Inspect the Pterodactyl console and Wings logs.
3. Check the startup command and required files.
4. Verify file permissions and mounted volumes.
5. Confirm all required application dependencies are installed.

## Contributing

Bug reports and improvements can be submitted through GitHub Issues or pull requests.

**Issues:** https://github.com/akaanakbaik/image-go/issues

## License

Refer to the repository's LICENSE file if present.
No license is implied when a LICENSE file is absent.

## Disclaimer

These images are community-maintained and are not official Pterodactyl images.
Upstream runtime projects retain their respective trademarks and licenses.
