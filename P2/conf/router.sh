#!/bin/bash

# $1: local VXLAN tunnel endpoint's IP address [10.1.1.1/24]
# $2: switch interface [eth0]
# $3: VXLAN tunnel endpoint's IP address [10.1.1.2/24]
# $4: host interface [eth1]
# $5: VXLAN IP address [20.1.1.1/24]

ip link add br0 type bridge
ip link set dev br0 up
ip addr add $1 dev $2
ip link add name vxlan10 type vxlan id 10 dev $2 remote $3 local $1 dstport 4789
ip addr add $5 dev vxlan10
brctl addif br0 $4
brctl addif br0 vxlan10
ip link set dev vxlan10 up
 