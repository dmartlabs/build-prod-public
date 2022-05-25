echo "Building Container"
CONTAINER_NAME=asia.gcr.io/${PROJECT_ID}/${SHORT_REPO_NAME}:${SHORT_SHA}
echo 'Container name: ' $CONTAINER_NAME

if [[ $DEBUG = "enabled" ]]; then
  echo "### DEBUG ###"
  echo "In Docker Build :: Environment vars"
  echo ""
  env
  echo "In env file..."
  cat .build_env
  echo ""
  echo "Current working dir " $(pwd)
  ls -al
  echo "### END DEBUG ###"
fi

# check if the PORTS env variable is set.
cmd='docker build --build-arg SHORT_REPO_NAME='\'$SHORT_REPO_NAME\'
build_context="."
if [ ! -z "$PORTS" ]; then
    echo 'Ports override is set...:'$PORTS
    cmd=$cmd' --build-arg PORTS='\'$PORTS\'
    echo $cmd
fi

if [[ $GLOWROOT_APM = "enabled" ]]; then
    echo "Glowroot APM enabled. Configuring APM"
    apt install -y -qq unzip > /dev/null
    curl -L -s https://github.com/glowroot/glowroot/releases/download/v0.13.6/glowroot-0.13.6-dist.zip -o agent.zip > /dev/null
    unzip agent.zip
    build_context=' -f ./apm/Dockerfile .'
fi
if [ ! -z "$JAVA_BUILD" ]; then 
    if [ ! -z "$JAVA_ARG_MEM_MAX" ]; 
    then
        echo 'JAVA_ARG_MEM_MAX is set...:'$JAVA_ARG_MEM_MAX
        cmd=$cmd' --build-arg JAVA_ARG_MEM_MAX='\'$JAVA_ARG_MEM_MAX\'
    else
        echo 'JAVA_ARG_MEM_MAX is not set. Setting default value'
        cmd=$cmd' --build-arg JAVA_ARG_MEM_MAX=-Xmx512M'
    fi

    if [ ! -z "$JAVA_ARG_MEM_MIN" ]; 
    then
        echo 'JAVA_ARG_MEM_MIN is set...:'$JAVA_ARG_MEM_MIN
        cmd=$cmd' --build-arg JAVA_ARG_MEM_MIN='\'$JAVA_ARG_MEM_MIN\'
    else
        echo 'JAVA_ARG_MEM_MIN is not set. Setting default value'
        cmd=$cmd' --build-arg JAVA_ARG_MEM_MIN=-Xms256M'
    fi

    if [ ! -z "$JAVA_ARG_EXTRAS" ]; 
    then
        echo 'JAVA_ARG_EXTRAS is set...:'$JAVA_ARG_EXTRAS
        cmd=$cmd' --build-arg JAVA_ARG_EXTRAS='\'$JAVA_ARG_EXTRAS\'
    else
        echo 'JAVA_ARG_EXTRAS is not set. Setting default value'
        cmd=$cmd' --build-arg JAVA_ARG_EXTRAS=-Djdk.tls.client.protocols=TLSv1,TLSv1.1,TLSv1.2'
    fi
fi

cmd=$cmd' -t '$CONTAINER_NAME' '$build_context

if [[ $DEBUG = "enabled" ]]; then
  echo "### DEBUG ###"
  echo "In Docker Build :: Docker build command"
  echo ""
  echo $cmd
  echo ""
  echo ""
  echo "Current working dir " $(pwd)
  ls -al
  echo "### END DEBUG ###"
fi

eval $cmd

#docker build --build-arg SHORT_REPO_NAME=$SHORT_REPO_NAME -t $CONTAINER_NAME .
docker push $CONTAINER_NAME