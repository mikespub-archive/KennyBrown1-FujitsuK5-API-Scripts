#!/bin/bash
## Created by: Kenny Brown
## Script to add a network port to a VM
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

SERVER_ID=  ## Add VM ID
PORT_ID=  ## Add port ID


curl -X POST -k -s $COMPUTE/v2/$PROJECT_ID/servers/$SERVER_ID/os-interface -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"interfaceAttachment": {"port_id": "'$PORT_ID'"}}' | jq 
