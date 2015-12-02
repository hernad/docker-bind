FROM ubuntu

MAINTAINER Ernad Husremovic 

# thank you Jasmin Beganovic <bjasko@bring.out.ba>

RUN apt-get update -q && \
    apt-get install -qy bind9 iptables traceroute tcpdump && \
    apt-get clean

VOLUME  ["/etc/bind"]

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]

