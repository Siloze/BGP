router1:
	ip link add br0 type bridge
	ip link set dev br0 up
	ip addr add 10.1.1.1/24 dev eth0
	ip link add name vxlan10 type vxlan id 10 \
		dev eth0 \
		remote 10.1.1.2/24 \
		local 10.1.1.1/24 \
		dstport 4789
	ip addr add 20.1.1.1/24 dev vxlan10
	brctl addif br0 eth1
	brctl addif br0 vxlan10
	ip link set dev vxlan10 up

router2:
	ip link add br0 type bridge
	ip link set dev br0 up
	ip addr add 10.1.1.2/24 dev eth0
	ip link add name vxlan10 type vxlan id 10 \
		dev eth0 \
		remote 10.1.1.1/24 \
		local 10.1.1.2/24 \
		dstport 4789
	ip addr add 20.1.1.2/24 dev vxlan10
	brctl addif br0 eth1
	brctl addif br0 vxlan10
	ip link set dev vxlan10 up

host1:
	ip addr add 30.1.1.1 dev eth0

host2:
	ip addr add 30.1.1.2 dev eth0

.PHONY: router1 router2 host1 host2
