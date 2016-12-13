#!/bin/bash
## Created by: Kenny Brown
## Script to create a Firewall
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide
. /k5Default.rc

FW_NAME=  ## Add name for the firewall
FWP_ID=   ## Add the firewall policy ID
ROUTER_ID=  ## Add the router ID
AVAILABILITY_ZONE=  ## Add the AZ name eg uk-1a

curl -X POST -k -s $NETWORK/v2.0/fw/firewalls -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"firewall":{"name":"'$FW_NAME'","firewall_policy_id": "'$FWP_ID'", "router_id": "'$ROUTER_ID'", "availability_zone": "'$AVAILABILITY_ZONE'"}}' | jq .

