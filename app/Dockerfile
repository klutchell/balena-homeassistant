FROM homeassistant/home-assistant:2021.5.4

COPY hostname.sh /etc/cont-init.d/10-hostname.sh

RUN chmod +x /etc/cont-init.d/10-hostname.sh

ENV BALENA_HOSTNAME homeassistant
