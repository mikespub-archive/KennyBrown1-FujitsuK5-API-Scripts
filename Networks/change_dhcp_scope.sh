#!/bin/bash
## Created by: Kenny Brown
## Script to update the DHCP scope on a subnet
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

SUBNET_ID=   ## Add subnet ID
ALLOCATION_POOL={\"\start":\"10.10.10.2\",\"end\":\"10.10.10.200\"}  ## Change to the correct start and end IP

curl -i $NETWORK/v2.0/subnets/$SUBNET_ID -X PUT -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type:   application/json" -d '{"allocation_pools": ['$ALLOCATION_POOL'] }}' | jq .
