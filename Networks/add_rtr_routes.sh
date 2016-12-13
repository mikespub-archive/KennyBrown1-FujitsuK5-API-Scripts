#!/bin/bash
## Created by: Kenny Brown
## Script to add routes to a router
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc


ROUTER_ID=    ##  Add the router ID
ROUTES={\"nexthop\":\"172.16.1.1\",\"destination\":\"192.168.1.0/24\"}   ## This will overwrite the current routes so include any existing routes that need to be retained

curl -i  $NETWORK_EX/v2.0/routers/$ROUTER_ID -X PUT -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type:  application/json" -d '{"router": { "routes":  ['$ROUTES'] }}'
