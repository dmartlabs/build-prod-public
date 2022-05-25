if [ -f "package.json" ]; then
  echo "Preparing for npm build"
  if [ -f "app.js" ]; then
    echo "app.js found. Preparing node server build"
    echo "THIS IS STILL A TODO"
  else
    echo "Prparing for nginx deployment"
    cp -r build-prod/profiles/npm/nginx/* ./
  fi
elif [ -f "pom.xml" ]; then
  echo "Preparing a maven build"
  cp -r build-prod/profiles/mvn/* ./
else
  echo "Unable to detect build type. Will fail "
  exit 1
fi