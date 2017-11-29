FROM ubuntu:17.10
MAINTAINER Seinlin <seinlin.manug@gmail.com>

USER root

RUN apt-get update

RUN dpkg --add-architecture i386
RUN dpkg --add-architecture amd64

RUN apt-get install -y --no-install-recommends ssh libxt6 bc autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib git lib32ncurses5-dev lib32z1-dev libgconf2-dev zlib1g zlib1g-dev libgl1-mesa-dev libx11-dev make zip lzop libxml2-utils openjdk-8-jdk nodejs unzip python vim

