FROM    alpine:latest

COPY    ../P2/Makefile /Makefile
COPY    ../P2/host.sh /ipconfig.sh

#       INSTALL BUSYBOX
RUN     apk update && \
        apk add make && \
        apk add util-linux
