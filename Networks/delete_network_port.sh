#!/bin/bash
## Created by: Kenny Brown
## Script to delete a network port
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

PORT_ID=  ## Network port ID to be deleted

curl -X DELETE -k -s $NETWORK/v2.0/ports/$PORT_ID -H "X-Auth-Token: $OS_AUTH_TOKEN" | jq
