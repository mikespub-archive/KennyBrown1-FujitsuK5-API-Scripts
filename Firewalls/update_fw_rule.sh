#!/bin/bash
## Created by: Kenny Brown
## Script to update FW rule
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

## the following variables are optional and only those that are needed for the FW rule should be added
FWR_NAME=  ## Add Firewall rule name
AC=   ## Add action allow or deny
SOURCE_IP=  ## Add source IP CIDR (x.x.x.x/x)
SOURCE_PORT= ## Add source port
PROTOCOL=  ## Add protocol
DESTINATION_IP=  ## Add destination IP CIDR (x.x.x.x/x)
DESTINATION_PORT=  ## Add destination port

## Edit the command to only include the elements that are needed within the rule eg destination IP, destination port, protocal action and AZ

curl -X PUT -k -s $NETWORK/v2.0/fw/firewall_rules/$FWR_ID -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"firewall_rule": { "name": "'$FWR_NAME'", "source_ip_address": "'$SOURCE_IP'", "destination_ip_address": "'$DESTINATION_IP'" }}' | jq .
