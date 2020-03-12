FROM ubuntu:18.04

#
# UTF-8 by default
#
#RUN locale-gen en_US.UTF-8
ENV LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

#
# Pull Zulu OpenJDK binaries from official repository:
#
RUN apt-get -qq update \
 && apt-get -qqy install gnupg \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 \
 && echo "deb http://repos.azulsystems.com/ubuntu stable main" >> /etc/apt/sources.list.d/zulu.list \
 && apt-get -qq update \
 && apt-get -qqy install zulu-8=8.13.0.5 \
 && apt-get -qqy purge gnupg \
 && rm -rf /var/lib/apt/lists/*

#RUN apt-mark hold zulu-8
#RUN apt-get update && apt-get -y upgrade
