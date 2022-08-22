FROM ubuntu:focal

#---------------- Update Ubuntu--------------

RUN apt-get update --fix-missing && apt-get -y upgrade
RUN RUN apt install -y netcat
RUN apt-get update 
#--------------NGINX---------------
RUN apt-get install nginx -y 
RUN rm -rf /var/www/html/index.nginx-debian.html 
COPY /sakai /usr/share/nginx/html
COPY ach /etc/nginx/sites-available/ 
RUN rm -f /etc/nginx/nginx.conf 
COPY  ./nginx.conf  /etc/nginx/
RUN rm -f /etc/nginx/sites-enabled/* 
RUN ln -s /etc/nginx/sites-available/ach /etc/nginx/sites-enabled/ 

COPY wait.sh /wait.sh
RUN chmod +x /wait.sh

EXPOSE  80 8000 81 