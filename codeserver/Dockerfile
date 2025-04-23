FROM alpine AS build

ARG CODESERVER="https://github.com/coder/code-server/releases/download/v4.98.2/code-server-4.98.2-linux-amd64.tar.gz"
ARG DUMBINIT="https://github.com/Yelp/dumb-init/releases/latest/download/dumb-init_1.2.5_x86_64"

WORKDIR /rootfs

COPY rootfs .

RUN wget -O dumb-init "$DUMBINIT" \
 && chmod +x init dumb-init

RUN mkdir code-server \
 && wget -O- "$CODESERVER" | tar -zxf - --strip-components=1 -C code-server

FROM archlinux

COPY --from=build /rootfs /

VOLUME ["/data"]

ENTRYPOINT ["/init"]
