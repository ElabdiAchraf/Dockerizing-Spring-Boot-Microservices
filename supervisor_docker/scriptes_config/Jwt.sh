#!/bin/bash
MYSQL_DATA_BASE_NAME=$(printenv MYSQL_DATA_BASE_NAME)
MYSQL_HOST=$(printenv MYSQL_HOST)
MYSQL_PORT=$(printenv MYSQL_PORT)
MYSQL_USERNAME=$(printenv MYSQL_USERNAME)
MAIL_PORT=$(printenv MAIL_PORT)
MAIL_USERNAME=$(printenv MAIL_USERNAME)
MAIL_PASSWORD=$(printenv MAIL_PASSWORD)

java -DMYSQL_HOST=${MYSQL_HOST} -DMYSQL_DATA_BASE_NAME=${MYSQL_DATA_BASE_NAME}  -DMYSQL_PORT=${MYSQL_PORT} -DMAIL_PORT=${MAIL_PORT} -DMAIL_PORT=${MAIL_PORT} -DMAIL_USERNAME=${MAIL_USERNAME}  -DMAIL_PASSWORD=${MAIL_PASSWORD} -jar Jwt.jar 

