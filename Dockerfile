# Docker file to set up a container to build app-inventor2 source
# code and to run the app-inventor2 companion/server.  Allows users
# to develop AI2 apps offline.  Kinda
# References:
# https://github.com/mit-cml/appinventor-sources
# REM https://github.com/himgodfreyho/appinventor-docker

FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:openjdk-r/ppa && apt-get update && apt-get install -y \
	wget \
	unzip \
	openjdk-8-jdk \
	ant \
	lib32z1 \
	lib32ncurses5 \
	lib32bz2-1.0 \
	lib32stdc++6 \
    dos2unix \
	git


RUN wget -O /tmp/appengine.zip https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.66.zip

RUN unzip /tmp/appengine.zip -d /root && rm /tmp/appengine.zip

COPY resources/startserver.sh /root/scripts/
RUN dos2unix /root/scripts/startserver.sh

RUN chmod +x /root/scripts/startserver.sh

ENV PATH="$PATH:/root/appengine-java-sdk-1.9.66/bin/"

ENV PATH="$PATH:/root/scripts/"

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

ENV PATH="$PATH:$JAVA_HOME/bin"

RUN export JAVA_HOME
RUN export PATH
WORKDIR /root/

EXPOSE 8888
# update java to be 1.8 rather than the default 1.7 from ubu 
RUN update-alternatives --set java $(update-alternatives --list java | grep java-8)

ENTRYPOINT ["tail", "-f", "/dev/null"]