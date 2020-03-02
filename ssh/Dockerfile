FROM balenalib/raspberrypi3-ubuntu:run

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    curl \
    git \
    openssh-server \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -v /etc/ssh/ssh_host_*

VOLUME /root/.ssh
VOLUME /etc/ssh

COPY config /root/.ssh/
COPY sshd_config /etc/ssh/
COPY entrypoint.sh /

WORKDIR /config

CMD ["/bin/sh", "/entrypoint.sh"]
