#!/bin/sh

interface_to_router=eth0
interface_to_host=eth1

ip addr add $router_ip/24 dev $interface_to_router

# vxlan (router vxlan <-> other router vxlan)
ip link add name vxlan10 type vxlan id 10 dev $interface_to_router group 239.1.1.1 dstport 4789
ip addr add $vxlan_ip/24 dev vxlan10
ip link set dev vxlan10 up

# bridge (ethernet of host <-> router vxlan)
ip link add br0 type bridge
ip link set dev br0 up
brctl addif br0 $interface_to_host
brctl addif br0 vxlan10
