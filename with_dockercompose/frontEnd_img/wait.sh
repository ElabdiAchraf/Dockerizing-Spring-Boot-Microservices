#!/bin/sh

JAVA_OPTS=$(printenv JAVA_OPTS)

while ! nc -z gateway 9999; do
    echo "Waiting for the gateway service"
    sleep 3
done

while ! nc -z auth 9902 ; do
    echo "Waiting for the auth service"
    sleep 3
done

java ${JAVA_OPTS} -jar /myApp/Jwt.jar 