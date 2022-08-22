#!/bin/sh

JAVA_OPTS=$(printenv JAVA_OPTS)

while ! nc -z eureka 8761; do
    echo "Waiting for the Eureka Server"
    sleep 3
done

while ! nc -z  mongodb 27017; do
    echo "Waiting for the Mongodb Server"
    sleep 3
done

java ${JAVA_OPTS} -jar /myApp/Payment_Service.jar 