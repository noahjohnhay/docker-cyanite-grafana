FROM ubuntu:16.04
MAINTAINER Noah Hay <nhay@liveopscloud.com>
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /srv/graphite && \
	touch /srv/graphite/index && \
	apt-get -y update && \
	apt-get upgrade -y && \
	apt-get install -y build-essential python-dev libffi-dev libcairo2-dev python-pip git && \

COPY files/etc/graphite-api.yaml /etc/graphite-api.yaml

RUN pip install --upgrade pip && \
	pip install git+https://github.com/eliben/pycparser@release_v2.14 && \
	pip install cyanite && \
	pip install gunicorn graphite-api[cyanite]

EXPOSE 8000

CMD exec gunicorn -b 0.0.0.0:8000 -w 2 --log-level debug graphite_api.app:app