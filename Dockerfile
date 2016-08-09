FROM ubuntu:14.04
MAINTAINER Anirudh Ramanathan <foxish@google.com>

ENV MONGO_USER=mongodb \
    MONGO_DATA_DIR=/data/db \
    MONGO_LOG_DIR=/var/log/mongodb

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
 && echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org-server mongodb-org-shell \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 27017/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]