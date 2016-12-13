#!/bin/bash
## Created by: Kenny Brown
## Script to link network connector endpoint to network port
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

NETCON_EP_ID=   ## Add network connection endpoint ID
PORT_ID=   ## Add network port ID

curl -s -X PUT $NETWORK/v2.0/network_connector_endpoints/$NETCON_EP_ID/connect -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type:application/json" -d '{"interface": {"port_id": "'$PORT_ID'"}}' | jq .

