#!/bin/bash
## Created by: Kenny Brown
## Script to remove the inter project link
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

ROUTER_ID=  ## Add router ID
PORT_ID=   ## Add network port ID

curl -s $NETWORK_EX/v2.0/routers/$ROUTER_ID/remove_cross_project_router_interface -X PUT -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{ "port_id": "'$PORT_ID'" }' |jq .
