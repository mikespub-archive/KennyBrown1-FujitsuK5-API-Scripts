#!/bin/bash
## Created by: Kenny Brown
## Script to remove FW rule from policy
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

FWP_ID=  ## Add firewall policy ID
FWR_ID=  ## Add firewall rule ID

curl -X PUT -k -s $NETWORK/v2.0/fw/firewall_policies/$FWP_ID/remove_rule -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"firewall_rule_id": "'$FWR_ID'" }' | jq .
