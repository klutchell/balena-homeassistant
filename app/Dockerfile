FROM homeassistant/home-assistant:2021.6.6

COPY hostname.sh /etc/cont-init.d/10-hostname.sh

RUN chmod +x /etc/cont-init.d/10-hostname.sh

ENV DEVICE_HOSTNAME homeassistant
