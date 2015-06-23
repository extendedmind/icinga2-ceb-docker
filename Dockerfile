FROM debian:wheezy

MAINTAINER "Timo Tiuraniemi <timo.tiuraniemi@iki.fi>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
    && apt-get -qqy upgrade \
    && apt-get -qqy install --no-install-recommends bash sudo procps ca-certificates wget supervisor 
RUN wget --quiet -O - http://packages.icinga.org/icinga.key | apt-key add -
RUN echo "deb http://packages.icinga.org/debian icinga-wheezy-snapshots main" >> /etc/apt/sources.list
RUN apt-get -qq update \
    && apt-get -qqy install icinga2 \
    && apt-get clean

ADD content/ /

RUN chmod u+x /opt/supervisor/icinga2_supervisor

EXPOSE 5665
VOLUME ["/etc/icinga2"]

# Run supervisor
ENTRYPOINT ["/usr/bin/supervisord"]
