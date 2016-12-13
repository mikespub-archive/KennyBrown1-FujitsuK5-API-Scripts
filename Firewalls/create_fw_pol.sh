#!/bin/bash
## Created by: Kenny Brown
## Script to create a firewall policy
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

AVAILABILITY_ZONE=   ## Add AZ eg uk-1a
NAME=   ## Add firewall policy name

## Add the firewall rule ID that you want in the policy in the order they are to be applied
FWR1=
FWR2=
FWR3=
FWR4=
FWR5=
FWR6=
FWR7=
FWR8=
FWR9=
FWR10=
FWR11=
FWR12=
FWR13=
FWR14=
FWR15=
FWR16=
FWR17=
FWR18=
FWR19=
FWR20=
FWR21=
FWR22=
FWR23=
FWR24=
FWR25=
FWR26=


## Edit the command below to only include the rules needed in the order that they are to be applied
curl -X POST -k -s $NETWORK/v2.0/fw/firewall_policies -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"firewall_policy":{"firewall_rules": [ "'$FWR1'", "'$FWR2'", "'$FWR3'", "'$FWR4'", "'$FWR5'", "'$FWR6'", "'$FWR7'", "'$FWR8'", "'$FWR9'", "'$FWR10'", "'$FWR11'", "'$FWR12'", "'$FWR13'", "'$FWR14'", "'$FWR15'", "'$FWR16'", "'$FWR17'", "'$FWR18'", "'$FWR19'", "'$FWR20'", "'$FWR21'", "'$FWR22'", "'$FWR23'", "'$FWR24'", "'$FWR25'", "'$FWR26'"], "name": "'$NAME'", "availability_zone": "'$AVAILABILITY_ZONE'"}}' | jq .
