#!/bin/bash

#cidr=$(ip addr show dev enp0s8 | grep -w inet | sed 's/\s*inet \([0-9./]*\).*/\1/g')

# setup a bridge
ip link add br1 type bridge
ip link set br1 up promisc on

#ip addr del "${cidr}" dev enp0s8
#ip addr add "${cidr}" dev br1
#ip link set enp0s8 master br1

# setup a namespace
ip netns add ns1
ip -n ns1 link set lo up

# setup a veth device
ip link add veth1 type veth peer name vpeer1
ip link set veth1 up master br1
ip link set vpeer1 netns ns1
ip -n ns1 link set vpeer1 up

# setup vxlan
ip link add vx100 type vxlan id 100 dstport 4789 group 224.0.0.100 dev enp0s8 ttl 8
ip link set vx100 up master br1
