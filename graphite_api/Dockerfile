FROM centos:centos6
MAINTAINER Mike Brannigan <mikejbrannigan@gmail.com>

FROM ubuntu:16.04
MAINTAINER Noah Hay <nhay@liveopscloud.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update

RUN apt-get upgrade -y

RUN apt-get install -y build-essential python-dev libffi-dev libcairo2-dev python-pip git

COPY files/etc/graphite-api.yaml /etc/graphite-api.yaml

RUN pip install --upgrade pip

RUN pip install git+https://github.com/eliben/pycparser@release_v2.14

RUN pip install cyanite

RUN pip install gunicorn graphite-api[cyanite]

EXPOSE 8000

CMD exec gunicorn -b 0.0.0.0:8000 -w 2 --log-level debug graphite_api.app:app
