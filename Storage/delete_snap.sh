#!/bin/bash
## Created by: Kenny Brown
## Script to delete a snapshot
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

SNAP_ID=  ## Add snapshot ID

curl -X DELETE -k -s $BLOCKSTORAGE/v2/$PROJECT_ID/snapshots/$SNAP_ID -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" | jq .
