#!/bin/bash
## Created by: Kenny Brown
## Script to add routes to subnet
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

SUBNET_ID=  ## Add subnet ID
HOST_ROUTES={\"nexthop\":\"192.168.106.3\",\"destination\":\"192.168.105.0/24\"},{\"nexthop\":\"192.168.106.3\",\"destination\":\"10.183.163.160/27\"}  ## Update with the routes to be added to the subnet including any existing routes to be retained

curl -s $NETWORK/v2.0/subnets/$SUBNET_ID -X PUT -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type:application/json" -d '{"subnet": { "host_routes": ['$HOST_ROUTES'] }}' | jq .

