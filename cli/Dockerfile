FROM balenalib/raspberrypi4-64-python:3.6.9-buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    curl \
    git \
    openssh-server \
    rsync \
    sqlite3 \
    tar \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -v /etc/ssh/ssh_host_* \
    && sed -r 's|^[# ]*PubkeyAuthentication .*|PubkeyAuthentication yes|g' -i /etc/ssh/sshd_config \
    && sed -r 's|^[# ]*PasswordAuthentication .*|PubkeyAuthentication no|g' -i /etc/ssh/sshd_config \
    && pip3 install homeassistant-cli

VOLUME /run/sshd

WORKDIR /config

COPY entrypoint.sh /

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/config/.ssh/sshd_config"]
