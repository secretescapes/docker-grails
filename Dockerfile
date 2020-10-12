FROM openjdk:8-slim-buster

ENV GRAILS_VERSION 2.5.4
ENV CONFIG_FLAGS "--fully-static --without-npm" DEL_PKGS="libstdc++" RM_DIRS=/usr/include
WORKDIR /usr/lib/jvm

RUN apt-get update && \
	apt-get install -y curl bash zip unzip wget git && \
	wget "https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip" -O grails-$GRAILS_VERSION.zip && \
	unzip grails-$GRAILS_VERSION.zip && \
	rm -rf grails-$GRAILS_VERSION.zip && \
	ln -s grails-$GRAILS_VERSION grails

ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

ENV JAVA_OPTS "-Xmx3096M -server"
