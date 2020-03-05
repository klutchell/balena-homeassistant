FROM balenalib/raspberrypi4-64-ubuntu:run

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    git \
    openssh-server \
    python-minimal \
    sqlite3 \
    tar \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -v /etc/ssh/ssh_host_*

VOLUME /root/.ssh
VOLUME /etc/ssh

COPY sshd_config /etc/ssh/
COPY entrypoint.sh /

WORKDIR /config

CMD ["/bin/sh", "/entrypoint.sh"]
