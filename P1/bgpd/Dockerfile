FROM    debian:buster

#       INSTALL PREREQUISITES
RUN     apt update && apt upgrade -y && apt install lsb-release -y &&\
		apt install curl -y &&curl -s https://deb.frrouting.org/frr/keys.gpg | tee /usr/share/keyrings/frrouting.gpg > /dev/null && \
		echo deb '[signed-by=/usr/share/keyrings/frrouting.gpg]' https://deb.frrouting.org/frr $(lsb_release -sc) "frr-stable" | tee -a /etc/apt/sources.list.d/frr.list && \
		apt update && apt install frr frr-pythontools -y

#       CONFIGURE FRR
RUN     sed -i 's/^bgpd=no$/bgpd=yes/' /etc/frr/daemons && \
        sed -i 's/^ospfd=no$/ospfd=yes/' /etc/frr/daemons && \
        sed -i 's/^isisd=no$/isisd=yes/' /etc/frr/daemons

# ENTRYPOINT ["/etc/init.d/frr start"]
