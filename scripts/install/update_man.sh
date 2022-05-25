#!/bin/bash
echo ""
source ./install_envs.sh

export MASTER_AUTHORIZED_NETWORKS=106.51.86.180/32,125.17.114.66/32,122.15.178.69/32,130.211.235.71/32,34.123.53.22/32

echo "Getting cluster credentials"
gcloud container clusters get-credentials --zone $CLOUDSDK_COMPUTE_ZONE $CLOUDSDK_CONTAINER_CLUSTER

if [ $# -ne 1 ]; then
    echo "Invalid number of arguments. Has to be exactly one"
    exit 2
fi

if [ "$1" = "allow" ]; then

    echo "Check if there are other builds running"
    while [ `gcloud builds list | grep WORKING | wc -l` -gt 1 ]
    do  
        echo "Looks like there is a build running. waiting for some time"
        sleep $((1 + RANDOM % 60))
    done
    echo "Looks like there are no builds running"
    gcloud container clusters update $CLOUDSDK_CONTAINER_CLUSTER --region $CLOUDSDK_COMPUTE_ZONE --enable-master-authorized-networks --master-authorized-networks $MASTER_AUTHORIZED_NETWORKS,`curl -s ifconfig.me`/32
elif [ "$1" = "disallow" ]; then

    echo "Check if there are other builds running"
    
    if [ `gcloud builds list | grep WORKING | wc -l` -gt 1 ]; then
        echo "Looks like there is another build running...skip unsetting the master authorized network"
    else
        gcloud container clusters update $CLOUDSDK_CONTAINER_CLUSTER --region $CLOUDSDK_COMPUTE_ZONE --enable-master-authorized-networks --master-authorized-networks $MASTER_AUTHORIZED_NETWORKS
    fi
else
    echo "Invalid argument"
    exit 1
fi