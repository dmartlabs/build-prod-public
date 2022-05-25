# Author Harikrishnan M <hari@dmartlabs.com>
# This script detects the type of build based on pom.xml, app.js erc. 

echo "Detecting build type"

if [ -f "package.json" ]; then
  echo "Detected npm build"
  if [ -f "app.js" ]; then
    echo "app.js found. Preparing node server build"
    echo "THIS IS STILL A TODO"
  else
    echo "Building using npm"
    export NPM_BUILD=true
    docker run --rm -v \
      $(pwd):/build -w /build --env-file <(bash -c 'env') node:14.12.0-alpine3.11 /bin/sh \
      -c "echo BUILD ENVIRONMENT && env && npm install && npm rebuild node-sass && npm run build"
  fi
elif [ -f "pom.xml" ]; then
  echo "Detected a maven build"
  export JAVA_BUILD=true
  IMAGE_NAME=$APP_NAME:$SHORT_SHA
  echo "Image name: "$IMAGE_NAME 
  docker run --rm \
    -e SHORT_REPO_NAME:$SHORT_REPO_NAME \
    -v "$(pwd)":/usr/src/app \
    -w /usr/src/app asia.gcr.io/public-prod-01/mvn-builder:jdk11-gcloud348-0.0.1 mvn \
    -ntp install -DskipTests
elif [ -f "Cargo.toml"]; then
  echo "Detected Rust (Cargo) build"
  
else
  echo "Unable to detect build type. Will fail "
  exit 1
fi
