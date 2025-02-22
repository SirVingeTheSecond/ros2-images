.PHONY: build-local build-base build-desktop build-desktop-full build-simulation

REGISTRY ?= sirvingethesecond
VERSION ?= dev
PLATFORM ?= linux/amd64

# Build all images locally for the current platform
build-local: build-base build-desktop build-desktop-full build-simulation

# Build base image
build-base:
	@echo "Building ROS 2 Jazzy base image..."
	docker buildx build \
		--platform $(PLATFORM) \
		--tag $(REGISTRY)/ros2-jazzy-base:$(VERSION) \
		--file Dockerfile.base \
		--load .

# Build desktop image
build-desktop: build-base
	@echo "Building ROS 2 Jazzy desktop image..."
	docker buildx build \
		--platform $(PLATFORM) \
		--tag $(REGISTRY)/ros2-jazzy-desktop:$(VERSION) \
		--file Dockerfile.desktop \
		--load \
		--build-arg BASE_IMAGE=$(REGISTRY)/ros2-jazzy-base:$(VERSION) .

# Build desktop-full image
build-desktop-full: build-desktop
	@echo "Building ROS 2 Jazzy desktop-full image..."
	docker buildx build \
		--platform $(PLATFORM) \
		--tag $(REGISTRY)/ros2-jazzy-desktop-full:$(VERSION) \
		--file Dockerfile.desktop-full \
		--load \
		--build-arg BASE_IMAGE=$(REGISTRY)/ros2-jazzy-desktop:$(VERSION) .

# Build simulation image
build-simulation: build-base
	@echo "Building ROS 2 Jazzy simulation image..."
	docker buildx build \
		--platform $(PLATFORM) \
		--tag $(REGISTRY)/ros2-jazzy-simulation:$(VERSION) \
		--file Dockerfile.simulation \
		--load \
		--build-arg BASE_IMAGE=$(REGISTRY)/ros2-jazzy-base:$(VERSION) .