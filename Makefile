SDK_VERSION?=1.9.0

build:
	docker build -t playdate-compiler-action:latest --build-arg SDK_VERSION=$(SDK_VERSION) .
