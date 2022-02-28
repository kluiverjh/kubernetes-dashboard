#!/bin/bash

if [ -z "$RANCHER_URL" ]
then
      echo "Environment variable RANCHER_URL not set"
..... exit 1
fi
if [ -z "$RANCHER_TOKEN" ]
then
      echo "Environment variable RANCHER_TOKEN not set"
..... exit 1
fi

echo Login into rancher $RANCHER_URL with token $RANCHER_TOKEN
echo Project is $RANCHER_PROJECT

if [ -z "$RANCHER_PROJECT" ]
then
      echo "Environment variable RANCHER_PROJECT not set (see value from PROJECT ID column)"
	  rancher login --token $RANCHER_TOKEN $RANCHER_URL
..... exit 1
else
   rancher login --token $RANCHER_TOKEN --context $RANCHER_PROJECT $RANCHER_URL
   if [ $? -eq 0 ] 
   then
      echo "Logged into rancher."
   else
      echo "Failed to login; check if project_id is correct."
      rancher login --token $RANCHER_TOKEN $RANCHER_URL
      exit 1
   fi
fi

# curl -u '${ranchertoken}' -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' --insecure -d '{}' '${rancheraddress}/projectCatalogs/${projectid}:${catalog}?action=refresh
node dist/main
/bin/bash -c "trap : TERM INT; sleep infinity & wait"