SDK_VERSION?=1.9.0

build: download_sdk
	docker build -t playdate-compiler-action:latest --build-arg SDK_VERSION=$(SDK_VERSION) .

download_sdk: cache_dir
ifeq (,$(wildcard .sdk_cache/PlaydateSDK-$(SDK_VERSION).tar.gz))
	wget --output-document=.sdk_cache/PlaydateSDK-$(SDK_VERSION).tar.gz https://download-keycdn.panic.com/playdate_sdk/Linux/PlaydateSDK-$(SDK_VERSION).tar.gz
else
	@echo "Version $(SDK_VERSION) of the SDK already exists."
endif

cache_dir:
	mkdir -p .sdk_cache