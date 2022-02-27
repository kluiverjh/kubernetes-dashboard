#!/bin/bash


context="$INPUT_CONTEXT"

RANCHER_PROJECT="${RANCHER_TOKEN:-project-missing}"
RANCHER_TOKEN="${RANCHER_TOKEN:-token-missing}"
RANCHER_URL="${RANCHER_URL:https://rancher/v3}"

rancher login --token $RANCHER_TOKEN --context $RANCHER_PROJECT $RANCHER_URL
# rancher kubectl $*

/bin/bash -c "trap : TERM INT; sleep infinity & wait"