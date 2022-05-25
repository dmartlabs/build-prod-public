# Helper for preparing the files needed for the build and install
APP_NAME=$(echo $REPO_NAME | sed -e "s/github_dmartlabs_//g")

#echo "Preparing values file with the full set of environment variables"
#cp build-canary/scripts/build/prep_values.py ./
#docker run --rm -v $(pwd):/workspace \
#    -w /workspace gcr.io/$PROJECT_ID/python \
#    python prep_values.py
#if [ "$?" -ne 0 ]; then
#    echo "####-Build file prep FAILED !!!!-####"
#    exit 1
#fi

#if [[ $DEBUG = "enabled" ]]; then
#  echo "### DEBUG ###"
#  echo "Intermediate values used for helm chart creation..."
#  echo ""
#  cat values_env.yaml
#  echo ""
#  echo "### END DEBUG ###"
#fi

# The values_env.yaml file will now contain the updated env section. 
# But the env values still refer to the env variable
# The next section will substitute the placeholders with the actual values from the env
#echo ""
#echo "Completed parsing and creating intermediate values file.."
#echo ""

#if [[ $DEBUG = "enabled" ]]; then
#  echo "### DEBUG ###"
#  echo "Current working directory " $(pwd)
#  echo "Image: gcr.io/"$PROJECT_ID"/python" 
#  echo "Environment variables passed into docker: "
#  env | cut -f1 -d= | sed 's/^/-e /'
#  echo "### END DEBUG ###"
#fi

#docker run --rm $(env | cut -f1 -d= | sed 's/^/-e /') \
#    -v "$(pwd):/workspace" -w "/workspace" \
#    gcr.io/$PROJECT_ID/python /bin/sh \
#    -c "envsubst ${shell_format:+\"${shell_format}\"} \
#        < values_env.yaml | tee values_final.yaml > /dev/null"
#if [ "$?" -ne 0 ]; then
#    echo "####-Build file prep FAILED !!!!-####"
#    exit 1
#fi

#if [[ $DEBUG = "enabled" ]]; then
#  echo "### DEBUG ###"
#  echo "Final env variables"
#  cat values_final.yaml
#  echo "### END DEBUG ###"
#fi

#echo ""
#echo "Completed envsubst and creating final values file.."
#echo ""

#cp values_final.yaml build-canary/template/values.yaml
cp values-public-prod.yaml build-prod-public/template/values.yaml

cd build-prod/template
sed -e "s/APP_NAME/$APP_NAME/g" Chart.yaml.tpl | \
    sed -e "s/SHORT_SHA/$SHORT_SHA/g" -e "s/BRANCH_NAME/$BRANCH_NAME/g"\
    > Chart.yaml

cd /workspace