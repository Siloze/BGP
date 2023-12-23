FROM debian:buster

COPY config.sh config.sh

RUN apt-get upgrade ; apt-get update ; apt-get install git -y ; apt-get install autoconf -y ; apt-get install libtool -y ; apt-get install libjson-c-dev -y; apt-get install libelf-dev -y

RUN apt-get install cmake libpcre2-dev -y; apt-get install python3 -y; apt-get install python3-venv -y

RUN apt-get install protobuf-c-compiler libprotobuf-c-dev -y

RUN apt-get install libzmq5 libzmq3-dev -y

RUN git clone https://github.com/CESNET/libyang.git && cd libyang && git checkout v2.0.0 && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr -D CMAKE_BUILD_TYPE:String="Release" .. && \
	make && make install && groupadd -r -g 92 frr ; groupadd -r -g 85 frrvty ; adduser --system --ingroup frr --home /var/run/frr/ \
   --gecos "FRR suite" --shell /sbin/nologin frr ; usermod -a -G frrvty frr

RUN git clone https://github.com/frrouting/frr.git frr && \
	cd frr && ./bootstrap.sh && \
	./configure \
		--prefix=/usr \
		--includedir=\${prefix}/include \
		--bindir=\${prefix}/bin \
		--sbindir=\${prefix}/lib/frr \
		--libdir=\${prefix}/lib/frr \
		--libexecdir=\${prefix}/lib/frr \
		--localstatedir=/var/run/frr \
		--sysconfdir=/etc/frr \
		--with-moduledir=\${prefix}/lib/frr/modules \
		--enable-configfile-mask=0640 \
		--enable-logfile-mask=0640 \
		--enable-snmp=agentx \
		--enable-multipath=64 \
		--enable-user=frr \
		--enable-group=frr \
		--enable-vty-group=frrvty \
		--with-pkg-git-version \
		--with-pkg-extra-version=-MyOwnFRRVersion && \
		make && make install

RUN install -m 775 -o frr -g frr -d /var/log/frr ; \
	install -m 775 -o frr -g frrvty -d /etc/frr ; \
	install -m 640 -o frr -g frrvty tools/etc/frr/vtysh.conf /etc/frr/vtysh.conf ; \
	install -m 640 -o frr -g frr tools/etc/frr/frr.conf /etc/frr/frr.conf ; \
	install -m 640 -o frr -g frr tools/etc/frr/daemons.conf /etc/frr/daemons.conf ; \
	install -m 640 -o frr -g frr tools/etc/frr/daemons /etc/frr/daemons ; \

ENTRYPOINT ["config.sh"]