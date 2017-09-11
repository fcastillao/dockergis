FROM postgres:9.6
MAINTAINER Mike Dillon <mike@appropriate.io>

ENV POSTGIS_MAJOR 2.3
ENV POSTGIS_VERSION 2.3.2

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-9.6-postgis-2.3\
           postgresql-9.6-postgis-scripts\
           postgis\
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./update-postgis.sh /usr/local/bin

