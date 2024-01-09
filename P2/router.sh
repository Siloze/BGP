#!/bin/bash

# $1: router address [10.1.1.x/24]
# $2: pair address [10.1.1.x/24]
# $3: vxlan address [20.1.1.x/24]

ip link add br0 type bridge
ip link set dev br0 up
ip addr add $2 dev eth0
ip link add name vxlan10 type vxlan id 10 \
    dev eth0 \
    remote $1 \
    local $2 \
    dstport 4789
ip addr add $3 dev vxlan10
brctl addif br0 eth1
brctl addif br0 vxlan10
ip link set dev vxlan10 up