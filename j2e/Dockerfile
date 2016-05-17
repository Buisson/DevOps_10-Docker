FROM java:8-jre

#RUN apt-get install -y wget

ADD createBDD.sh /usr/createBDD.sh
RUN exec /usr/createBDD.sh

RUN wget http://apache.crihan.fr/dist/tomee/tomee-1.7.4/apache-tomee-1.7.4-plus.tar.gz

RUN tar -zxvf apache-tomee-1.7.4-plus.tar.gz

ADD target/tcf-backend.war apache-tomee-plus-1.7.4/webapps

EXPOSE 8080

CMD ./apache-tomee-plus-1.7.4/bin/catalina.sh run
