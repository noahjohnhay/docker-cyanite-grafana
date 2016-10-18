FROM debian:wheezy
FROM 460140541257.dkr.ecr.us-east-1.amazonaws.com/java8
MAINTAINER Noah Hay <nhay@liveopscloud.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://debian.datastax.com/community stable main" >> /etc/apt/sources.list

RUN wget http://debian.datastax.com/debian/repo_key && apt-key add repo_key && rm repo_key

RUN apt-get -y update && apt-get -y install cassandra=2.1.9 && apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY files/opt/cyanite/ /opt/cyanite/

COPY files/etc/cyanite.yaml /etc/cyanite.yaml

EXPOSE 2003 8080

CMD [ "/opt/cyanite/cyanite.sh" ]