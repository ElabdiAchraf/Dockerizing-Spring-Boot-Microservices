#!/bin/bash
SERVER_PORT=$(printenv SM_SERVER_PORT)
MONGODB_PORT=$(printenv SM_MONGODB_PORT)

java -DSERVER_PORT=${SERVER_PORT} -DMONGODB_PORT=${MONGODB_PORT}   -jar fileuploadanddwonload.jar 

