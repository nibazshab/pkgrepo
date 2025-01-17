FROM alpine AS build

ARG CODESERVER="https://github.com/coder/code-server/releases/download/v4.96.2/code-server-4.96.2-linux-amd64.tar.gz"
ARG DUMBINIT="https://github.com/Yelp/dumb-init/releases/latest/download/dumb-init_1.2.5_x86_64"

WORKDIR /rootfs
COPY rootfs .
RUN chmod +x init

WORKDIR /build/code-server
RUN wget -O- "$CODESERVER" | tar -zxvf - --strip-components=1 \
 && mv ../code-server /rootfs

WORKDIR /build/dumb-init
RUN wget -O dumb-init "$DUMBINIT" \
 && chmod +x dumb-init \
 && mv dumb-init /rootfs

FROM archlinux

COPY --from=build /rootfs /
RUN ln -sf /code-server/bin/code-server /usr/bin \
 && ln -sf /dumb-init /usr/bin

RUN sed -i 's/#DisableSandbox/DisableSandbox/g' /etc/pacman.conf
VOLUME ["/data"]
ENTRYPOINT ["/init", "--bind-addr", "0.0.0.0:8081"]
