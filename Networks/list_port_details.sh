#!/bin/bash
## Created by: Kenny Brown
## Script to retrieve port details
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

PORT_ID=   ## Add port ID

curl -k -s $NETWORK/v2.0/ports/$PORT_ID -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" | jq .
