#!/bin/bash
echo "Checking mandatory environment variables"

mandatory_vars=(NAMESPACE CLOUDSDK_COMPUTE_ZONE CLOUDSDK_CONTAINER_CLUSTER)

for var in "${mandatory_vars[@]}"
do
    echo "##-Checking variable $var-##"
    v="$var"
    if [ -z $(echo ${!v}) ]; then 
        echo "  FAILED!!!! $var not set. Cannot proceed.."
        exit 1
    else
        echo "  ##-Variable check passed-##"
    fi
done