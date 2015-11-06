FROM ubuntu:14.04
MAINTAINER Jasmin Beganović <bjasko@bring.out.ba>

  
RUN apt-get update -q
RUN apt-get install -qy bind9 iptables traceroute tcpdump 

VOLUME  ["/etc/bind"]

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]

