FROM ubuntu:14.04

MAINTAINER "Timo Tiuraniemi <timo.tiuraniemi@iki.fi>"

ENV DEBIAN_FRONTEND noninteractive

# Install Icinga2
RUN apt-get -qy install software-properties-common
RUN add-apt-repository ppa:formorer/icinga
RUN apt-get -q update
RUN apt-get -qy install icinga2

# Stop the Icinga2 service and prevent it from starting automatically
RUN service icinga2 stop
RUN echo "manual" > /etc/init/icinga2.override

# Start Icinga2 by default as daemon but without "-d" = detach
ENTRYPOINT ["/usr/sbin/icinga2"]
CMD ["daemon"]
