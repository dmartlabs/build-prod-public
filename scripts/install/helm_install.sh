#!/bin/bash

source .build_env

echo "Installing helm"
# curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && chmod 700 get_helm.sh
./get_helm.sh --version v3.5.4

APP_NAME=$(echo ${REPO_NAME} | sed -e 's/github_dmartlabs_//g')
CONTAINER_NAME=$(echo asia.gcr.io/$PROJECT_ID/$APP_NAME)

echo "Installing chart for $APP_NAME using $CONTAINER_NAME:$SHORT_SHA"
cd build-prod-public

if [[ $DEBUG = "enabled" ]]; then
    echo "### HELM DEBUG MODE SET ###"
    echo "values.yaml file:"
    cat template/values.yaml
    echo "### END values.yaml ###"
    export HELM_DEBUG=true
fi

helm upgrade ${APP_NAME} --install --create-namespace \
    --set image.repository=$CONTAINER_NAME \
    --set image.tag=$SHORT_SHA \
    --cleanup-on-fail \
    -n ${NAMESPACE} \
    ./template

#git clone https://8557bf488cfa031d88f4d98f3c11eae42609c053@github.com/dmartlabs/appstate-canary.git
#mkdir -p appstate-canary/$APP_NAME && cd appstate-canary/$APP_NAME
#if [ "$?" -ne 0 ]; then
#    git checkout failed
#fi


