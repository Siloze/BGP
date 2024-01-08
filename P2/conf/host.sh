#!/bin/bash

# $1: ip address of the host interface [30.1.1.1/24]
# $2: host interface [eth0]

ip addr add $1 dev $2