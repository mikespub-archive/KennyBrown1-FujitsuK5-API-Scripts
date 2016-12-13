#!/bin/bash
## Created by: Kenny Brown
## Script to create a network port
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

NETWORK_ID=  ## Add the network ID that the port is to be created in

curl -X POST -k -s $NETWORK/v2.0/ports -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"port":{"network_id":"'$NETWORK_ID'","admin_state_up": true,"availability_zone": "uk-1a"}}' | jq .
