#!/bin/bash
## Created by: Kenny Brown
## Script to create FW rule
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
AVAILABILITY_ZONE=  ## Add AZ eg uk-1a (must be included)

## Edit the command to only include the elements that are needed within the rule eg destination IP, destination port, protocal action and AZ

curl -X POST -k -s $NETWORK/v2.0/fw/firewall_rules -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"firewall_rule": { "name": "'$FWR_NAME'" ,"action": "'$AC'", "source_ip_address": "'$SOURCE_IP'", "destination_ip_address": "'$DESTINATION_IP'", "destination_port": "'$DESTINATION_PORT'", "protocol": "'$PROTOCOL'", "availability_zone": "'$AVAILABILITY_ZONE'" }}' | jq .
