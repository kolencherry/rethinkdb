#
# RethinkDB Dockerfile
#
# https://github.com/dockerfile/rethinkdb
#

# Pull base image.
FROM centos:centos6

RUN yum clean all && yum update -y && yum install -y wget

# Install RethinkDB.
RUN wget http://download.rethinkdb.com/centos/6/`uname -m`/rethinkdb.repo \
    -O /etc/yum.repos.d/rethinkdb.repo
RUN yum install -y rethinkdb

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["rethinkdb", "--bind", "all"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015
