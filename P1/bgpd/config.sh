#!/bin/sh

# CONFIGURE FRROUTING (https://docs.frrouting.org/en/latest/setup.html)
sed -i 's/^bgpd=no$/bgpd=yes/' /etc/frr/daemons
sed -i 's/^ospfd=no$/ospfd=yes/' /etc/frr/daemons
sed -i 's/^isisd=no$/isisd=yes/' /etc/frr/daemons

tail -f /dev/null