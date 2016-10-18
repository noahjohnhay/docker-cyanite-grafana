FROM ubuntu:14.04
FROM 460140541257.dkr.ecr.us-east-1.amazonaws.com/java8
FROM 460140541257.dkr.ecr.us-east-1.amazonaws.com/java8

MAINTAINER Noah Hay <nhay@liveopscloud.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update

COPY files/opt/cyanite/ /opt/cyanite/

COPY files/etc/cyanite.yaml /etc/cyanite.yaml

EXPOSE 2003 8080

CMD [ "/opt/cyanite/cyanite.sh" ]
