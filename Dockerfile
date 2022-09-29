FROM docker.io/crops/poky:debian-11

USER root

RUN set -exu \
  && apt-get update \
  && apt-get -yq install \
    rsync \
    gdisk \
    fdisk \
    dosfstools \
    mtools \
    bison \
    flex \
    zsh \
    git \
    curl \
    wget

# RUN set -exu \
#   && echo "pokyuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
#   && chown root:root /etc/sudoers

RUN set -exu \
  && mkdir -p /home/pokyuser

COPY ./interactive/home/pokyuser/.* /home/pokyuser/

RUN set -exu \
  && chown -R 1000:1000 /home/pokyuser

WORKDIR /opt/yocto

USER usersetup
ENV LANG=en_US.UTF-8

ENTRYPOINT ["/usr/bin/distro-entry.sh", "/usr/bin/dumb-init", "--", "/usr/bin/poky-entry.py"]
