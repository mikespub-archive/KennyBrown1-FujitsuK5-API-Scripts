#!/bin/bash
## Created by: Kenny Brown
## Script to create snapshot
## This script requires the K5 API login details and connection settings to be configured in . /k5Default.rc.
## An authentication token must be generated prior to running the script.
## Information on how to setup the configuration file and authentication token can be found in the K5 api guide

. /k5Default.rc

VOLUME_ID=  ## Add Volume ID
FORCE=true
DESCRIPTION=  ## Add description
SNAP_NAME=  ## Add snapshot name

curl -X POST -k -s $BLOCKSTORAGE/v2/$PROJECT_ID/snapshots -H "X-Auth-Token: $OS_AUTH_TOKEN" -H "Content-Type: application/json" -d '{"snapshot": { "name": "'$SNAP_NAME'", "volume_id": "'$VOLUME_ID'", "force": '$FORCE' }}' | jq .
