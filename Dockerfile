FROM debian:wheezy
MAINTAINER uochan

ENV DEBIAN_FRONTEND noninteractivetoken

RUN apt-get update && \
    apt-get install -y sudo curl openssh-client ruby

RUN curl https://toolbelt.heroku.com/install.sh | sh
ENV PATH $PATH:/usr/local/heroku/bin

RUN apt-get clean &&\
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
