# our base image
FROM ubuntu:12.04

RUN apt-get -y update && apt-get -y install mono-complete

ADD dotNet /usr/src/app/dotNet

RUN cd /usr/src/app/dotNet && ./compile.sh

EXPOSE 9090

CMD cd /usr/src/app/dotNet && mono server.exe


