FROM eg5846/supervisor-docker:trusty
MAINTAINER Andreas Egner <andreas.egner@web.de>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y polipo tor && apt-get clean

ADD start_tor.sh /start_tor.sh
RUN chmod 0755 /start_tor.sh

ADD polipo_config /etc/polipo/config
ADD start_polipo.sh /start_polipo.sh
RUN chmod 0755 /start_polipo.sh

ADD tor.conf /etc/supervisor/conf.d/tor.conf
ADD polipo.conf /etc/supervisor/conf.d/polipo.conf

EXPOSE 22 8118

CMD ["/run.sh"]
