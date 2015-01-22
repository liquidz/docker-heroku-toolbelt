FROM debian:wheezy
MAINTAINER uochan

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractivetoken

RUN apt-get update && \
    apt-get install -y sudo curl openssh-client ruby git

RUN curl https://toolbelt.heroku.com/install.sh | sh
ENV PATH $PATH:/usr/local/heroku/bin

ONBUILD RUN ssh-keygen -t rsa -f ~/.ssh/heroku_rsa_key -C heroku@docker.local
ONBUILD RUN echo "Host heroku.com"                        >  ~/.ssh/config
ONBUILD RUN echo "    HostName heroku.com"                >> ~/.ssh/config
ONBUILD RUN echo "    IdentityFile ~/.ssh/heroku_rsa_key" >> ~/.ssh/config
ONBUILD RUN echo "    User git"                           >> ~/.ssh/config

ADD heroku_login.sh /heroku_login.sh

RUN apt-get clean &&\
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
