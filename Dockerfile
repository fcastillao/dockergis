FROM postgres:9.6

#Based On
MAINTAINER Mike Dillon <mike@appropriate.io>

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-9.6-postgis-2.3\
           postgresql-9.6-postgis-scripts\
           postgresql-contrib-9.6\
           postgresql-9.6-pgrouting\
           postgis\
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh

