# Multi-Architecture Docker Images for ROS 2

This repository contains Dockerfiles to build multi-architecture (AMD64 and ARM64) Docker images for ROS 2 Jazzy.

## Available Images

The following images are built from this repository:

- `sirvingethesecond/ros2-jazzy-base:latest` - Base ROS 2 Jazzy image with minimal packages
- `sirvingethesecond/ros2-jazzy-desktop:latest` - ROS 2 Jazzy with desktop packages
- `sirvingethesecond/ros2-jazzy-desktop-full:latest` - ROS 2 Jazzy with desktop-full packages
- `sirvingethesecond/ros2-jazzy-simulation:latest` - ROS 2 Jazzy with simulation packages

All images support both `linux/amd64` and `linux/arm64` platforms.

## Building Locally

You can build the images locally using the provided Makefile:

```bash
# Build base image
make build-base

# Build desktop image
make build-desktop

# Build desktop-full image
make build-desktop-full

# Build simulation image
make build-simulation

# Build all images
make build-local
```

By default, images are built for your current platform. To build for a specific platform, use:

```bash
make build-base PLATFORM=linux/arm64
```

## Using the Images

These images are intended to be used as base images for ROS 2 development. Example usage in a Dockerfile:

```dockerfile
FROM sirvingethesecond/ros2-jazzy-desktop-full:latest

# Add layers here
```

Or in a docker-compose.yml file:

```yaml
services:
  ros2:
    image: sirvingethesecond/ros2-jazzy-desktop-full:latest
    # Additional configuration
```

## Automated Builds

This repository uses GitHub Actions to automatically build and push multi-architecture images to Docker Hub. Images are built:

- On push to main branch
- On tag creation (v*.*.*)
- Weekly on Sundays
- Manually via workflow dispatch

## License

This project is licensed under the MIT License - see the LICENSE file for details.