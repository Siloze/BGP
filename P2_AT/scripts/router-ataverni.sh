#!/bin/sh

export router_ip=10.1.1.1
export other_router_ip=10.1.1.2
export vxlan_ip=20.1.1.1

# sh /tmp/setup_static.sh
sh /tmp/setup_multicast.sh
