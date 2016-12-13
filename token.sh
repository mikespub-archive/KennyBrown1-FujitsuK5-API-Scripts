#!/bin/bash
## Created by: Kenny Brown
## Script to retrieve token
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.

. /k5Default.rc

export OS_AUTH_TOKEN=`curl -k -X POST -si $TOKEN/v3/auth/tokens -H "Content-Type:application/json" -H "Accept:application/json" -d '{"auth":{"identity":{"methods":["password"],"password":{"user":{"domain":{"name":"'$DOMAIN_NAME'"}, "name":"'$USER_NAME'", "password": "'"$USER_PW"'"}}}, "scope": { "project": {"id":"'$PROJECT_ID'"}}}}' | awk '/X-Subject-Token/ {print $2}'`
echo Token set: $OS_AUTH_TOKEN

