#!/bin/sh

echo net.ipv4.ip_forward=1 | tee -a /etc/sysctl.conf && sysctl -p
# touch /etc/quagga/zebra.conf /etc/quagga/bgpd.conf /etc/quagga/ospfd.conf
# chown quagga.quaggaavty /etc/quagga/*.conf
# chmod 640 /etc/quagga/*.conf
# sed -i 's/^bgpd=no$/bgpd=yes/' /etc/quagga/daemons
# sed -i 's/^ospfd=no$/ospfd=yes/' /etc/quagga/daemons
# sed -i 's/^ospf6d=yes$/ospf6d=no/' /etc/quagga/daemons
# sed -i 's/^ripd=yes$/ripd=no/' /etc/quagga/daemons
# sed -i 's/^ripngd=yes$/ripngd=no/' /etc/quagga/daemons
# /etc/init.d/quagga restart
while true

