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
#import elasticsearch ca cert
RUN keytool -importcert -noprompt -trustcacerts -file certs/ca/ca.crt -keystore /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/cacerts -storepass changeit
