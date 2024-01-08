#!/bin/sh

interface_to_host=eth0
interface_to_router=eth1

ip addr add $router_ip/24 dev $interface_to_host

# vxlan (router vxlan <-> other router vxlan)
ip link add name vxlan10 type vxlan id 10 dev $interface_to_host remote $other_router_ip local $router_ip dstport 4789
ip addr add $vxlan_ip/24 dev vxlan10
ip link set dev vxlan10 up

# bridge (ethernet of host <-> router vxlan)
ip link add br0 type bridge
ip link set dev br0 up
brctl addif br0 $interface_to_router
brctl addif br0 vxlan10
