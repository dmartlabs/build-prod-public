#!/bin/bash

export SHORT_REPO_NAME=$(echo $REPO_NAME | sed -e 's/github_dmartlabs_//g')

export -p > .build_env

if [[ $DEBUG = "enabled" ]]; then
  echo "### DEBUG ###"
  echo "Environment vars"
  echo ""
  env
  echo "In env file..."
  cat .build_env
  echo ""
  echo "### END DEBUG ###"
fi

echo "########-Executing App build steps-########"
echo "####-Checking env variables-####"
source ./check_env.sh
if [ "$?" -ne 0 ]; then
    echo "####-Env Variable check failed !!!!-####"
    exit 1
fi
echo "####-Env Variable check passed-####"

echo "########-Executing App build steps-########"
echo "####-Preparing build files-####"
source ./prep_files.sh
if [ "$?" -ne 0 ]; then
    echo "####-Build file prep FAILED !!!!-####"
    exit 1
fi
echo "####-Build file prep complete-####"
echo "####-Preparing build profile-####"
source prep_profile.sh
if [ "$?" -ne 0 ]; then
    echo "####-Build profile prep FAILED !!!!-####"
    exit 1
fi
echo "####-Build profile prep complete-####"
echo "####-Building app"
source build_app.sh
if [ "$?" -ne 0 ]; then
    echo "####-Build app FAILED !!!!-####"
    exit 1
fi
echo "####-Building app complete-####"
echo "####-Building docker image-####"
source docker_build.sh
if [ "$?" -ne 0 ]; then
    echo "####-Docker build FAILED !!!!-####"
    exit 1
fi
echo "####-Docker image built and pushed-####"
echo "########-App build steps complete-########"
echo ""
