FROM ubuntu:20.04 AS builder
ARG SDK_VERSION=1.9.0
WORKDIR /opt
ADD .sdk_cache/PlaydateSDK-$SDK_VERSION.tar.gz ./PlaydateSDK-$SDK_VERSION/
RUN mv PlaydateSDK-$SDK_VERSION/* playdate/

FROM ubuntu:20.04
COPY --from=builder --chown=root:root /opt/playdate /opt/playdate
RUN apt-get update \
 && apt-get install --no-install-recommends -y libpng16-16 \
 && rm -rf /var/lib/apt/lists/*
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh && mkdir /build
WORKDIR /build
ENTRYPOINT ["/entrypoint.sh"]
