FROM eg5846/ubuntu:xenial
MAINTAINER Andreas Egner <andreas.egner@web.de>

# Install packages
RUN \
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
