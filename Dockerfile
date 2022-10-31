FROM ubuntu:20.04

COPY entrypoint.sh /

RUN apt-get update \
 && apt-get install --no-install-recommends -y ca-certificates libpng16-16 wget \
 && rm -rf /var/lib/apt/lists/*

RUN chmod +x /entrypoint.sh \
 && mkdir /build

ENTRYPOINT ["/entrypoint.sh"]
