#----------------- EL ABDI Achraf && AMMOR Yazid && Meskini Mohamed saad ----------------------

FROM ubuntu:focal
#---------------- Update Ubuntu--------------

RUN apt-get update --fix-missing && apt-get -y upgrade

#--------  Install supervisor & java jdk ----------------

RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-get install -y openjdk-11-jdk ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME
RUN apt-get -y install software-properties-common supervisor
RUN apt-get -y update

#--------------MONGODB---------------

RUN apt-get install wget
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc |  apt-key add -
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN  apt install -y mongodb

#--------------MYSQL---------------

RUN apt install -y mysql-server
RUN service mysql start
RUN apt-get update -y 

#--------------NGINX---------------

RUN apt-get install nginx -y 
RUN rm -rf /var/www/html/index.nginx-debian.html 
COPY /frent /usr/share/nginx/html
COPY /scriptes_config/ach /etc/nginx/sites-available/ 
RUN rm -f /etc/nginx/nginx.conf 
COPY  ./scriptes_config/nginx.conf  /etc/nginx/
RUN rm -f /etc/nginx/sites-enabled/* 
RUN ln -s /etc/nginx/sites-available/ach /etc/nginx/sites-enabled/ 



#--------------- Mount Data Volume -----------
VOLUME /var/lib/mysql



#--------------------- Define mountable directories.----------------
VOLUME ["/data/db"]


RUN mkdir -p /myApp


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY . /myApp

#------- premission ------------------

RUN chmod +x ./myApp/scriptes_config/dbcreation.sh
RUN chmod +x ./myApp/scriptes_config/Jwt.sh
RUN chmod +x ./myApp/scriptes_config/order.sh
RUN chmod +x ./myApp/scriptes_config/profile.sh
RUN chmod +x ./myApp/scriptes_config/fileService.sh
RUN chmod +x ./myApp/scriptes_config/immoService.sh
RUN chmod +x ./myApp/scriptes_config/paymentService.sh


# Expose ports.
EXPOSE 8761 3306 80 8000 81 

#CMD /bin/bash
CMD ["/usr/bin/supervisord", "-n"]