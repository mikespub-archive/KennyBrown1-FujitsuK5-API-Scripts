#!/bin/bash
## Created by: Kenny Brown
## Script to remove a network port from a VM
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

SERVER_ID=   ## Add VM ID
PORT_ID=   ## Add port ID

curl -X DELETE -k -s $COMPUTE/v2/$PROJECT_ID/servers/$SERVER_ID/os-interface/$PORT_ID -H "X-Auth-Token: $OS_AUTH_TOKEN" | jq
