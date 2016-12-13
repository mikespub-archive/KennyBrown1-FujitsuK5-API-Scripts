#!/bin/bash
## Created by: Kenny Brown
## Script to create network connector
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc


NAME=  ## Add network connector name

curl -s -X POST $NETWORK/v2.0/network_connectors -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type:application/json" -d '{"network_connector":{ "name": "'$NAME'"}}' | jq 
