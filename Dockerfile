FROM ubuntu:17.10
MAINTAINER Seinlin <seinlin.manug@gmail.com>

USER root

RUN apt-get update

RUN dpkg --add-architecture i386
RUN dpkg --add-architecture amd64

RUN apt-get install -y --no-install-recommends ssh libxt6 bc autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib git lib32ncurses5-dev lib32z1-dev libgconf2-dev zlib1g zlib1g-dev libgl1-mesa-dev libx11-dev make zip lzop libxml2-utils openjdk-8-jdk nodejs unzip python vim

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs build-essential
RUN npm install -g npm@4

RUN apt-get remove -y --purge cmdtest
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn

RUN apt-get install -y file less

ENV LC_ALL C.UTF-8
