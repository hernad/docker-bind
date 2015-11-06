#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

VOLUME_BASE=/data/dns 
S_HOST=ns-lan
S_DEV=eth1
S_DOMAIN=bring.out.ba
S_HOST_IP=${smtp_ip:-192.168.168.55}
S_DNS_HOST_IP=${dns_lan_ip:-192.168.168.55}
CT_NAME=dns-lan


sudo ip addr show | grep $S_HOST_IP || \
sudo ip addr add $S_HOST_IP/24 dev $S_DEV


docker rm -f  $CT_NAME
docker run -d \
      -v $VOLUME_BASE/$S_HOST.$S_DOMAIN/etc/bind:/etc/bind \
      --name $CT_NAME \
      -p $S_HOST_IP:53:53/udp  \
      bind9

