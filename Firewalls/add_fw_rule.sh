#!/bin/bash
## Created by: Kenny Brown
## Script to add Firewall rule to a policy
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

FWP_ID=   ##  Add firewall policy ID
FWR_ID=   ##  Add firewall rule ID
## The following are optional and are used to place the rule before or after an existing rule. 
INSERT_AFTER=   ## Add firewall rule ID for the existing rule to be added before
INSERT_BEFORE=  ## Add firewall rule ID for the existing rule to be added after

## Change "insert_before": "'$INSERT_BEFORE to "insert_after": "'$INSERT_AFTER depending on the action to be carried out
curl -X PUT -k -s $NETWORK/v2.0/fw/firewall_policies/$FWP_ID/insert_rule -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"firewall_rule_id": "'$FWR_ID'" , "insert_before": "'$INSERT_BEFORE'" }' | jq .
