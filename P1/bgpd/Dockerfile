from alpine:latest

COPY 	config.sh /var/config.sh

RUN	apk update

RUN	chmod 777 /var/config.sh

RUN 	apk add -u quagga && \
	mkdir -p /var/log/quagga && \
	chown quagga:quagga /var/log/quagga

RUN	apk add -u busybox && \
	apk add  busybox-extras &&\
	apk add --update util-linux

ENTRYPOINT ["/var/config.sh"] 
