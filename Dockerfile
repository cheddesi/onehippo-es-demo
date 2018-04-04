FROM maven:3-jdk-8-alpine
MAINTAINER siva chedde (cheddesi@gmail.com)

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh
