FROM maven:3-jdk-8-alpine
MAINTAINER siva chedde (cheddesi@gmail.com)

#install git and openssh
RUN apk update && apk upgrade && \
    apk add --no-cache git openssh
#create hippo directory
RUN cd /usr/share && mkdir hippo && cd hippo
#clone the git repo
RUN git clone -b develop https://github.com/cheddesi/camel-events-support.git
#run mvn clean
RUN cd camel-events-support/demo && mvn clean verify
