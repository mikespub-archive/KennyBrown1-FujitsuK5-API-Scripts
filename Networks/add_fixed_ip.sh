#!/bin/bash
## Created by: Kenny Brown
## Script to add Fixed IPs to a network port
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide
. /k5Default.rc

PORT_ID=     ## Add the port ID that needs the additional IP address
FIXED_IPS={\"subnet_id\":\"fe763588-9189-49c0-9b74-eb0824af6c8d\",\"ip_address\":\"10.10.10.9\"},{\"subnet_id\":\"fe763588-9189-49c0-9b74-eb0824af6c8d\",\"ip_address\":\"10.10.10.109\"} ##Set IP and subnet information for each IP to be added to the port. This will replace the current settings so add all fixed IPs.

curl -X PUT -k -s $NETWORK/v2.0/ports/$PORT_ID -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type:   application/json" -d '{"port": { "fixed_ips":  ['$FIXED_IPS'] }}'
