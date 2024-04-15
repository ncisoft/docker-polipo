FROM ubuntu:xenial
MAINTAINER Andreas Egner <andreas.egner@web.de>

ADD 01acng /etc/apt/apt.conf.d/
#ADD tuna.list /etc/apt/sources.list
# Update system and install packages
RUN \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y --no-install-recommends polipo && \
  apt-get clean

# Configure polipo
ADD polipo_config /etc/polipo/config

# Add run.sh
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

# Finally ...
EXPOSE 8118
VOLUME /var/log/polipo
CMD ["/run.sh"]
