# Stable Version
# wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/5.1.0/openapi-generator-cli-5.1.0.jar -O openapi-generator-cli.jar

# 5.0.0 Beta with DartEnums
# wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/5.0.0-beta2/openapi-generator-cli-5.0.0-beta2.jar -O openapi-generator-cli.jar

echo "Generating Client into temp folder"
rm ./_scripts/swagger.json
echo "Clearing openapi folder"
rm -rf plugins/openapi

set -e
wget https://dmechat-testnet-server.herokuapp.com/api-json -O ./_scripts/swagger.json
java -jar openapi-generator-cli.jar generate -i ./_scripts/swagger.json -g dart2-api -o ./plugins/dmechatapi --skip-validate-spec --model-name-suffix Model --type-mappings "Object"="Map" --additional-properties=pubLibrary=dmechatapi --additional-properties=pubName=dmechatapi

echo "Copying swagger.json into assets directory, and jq the necessary portion only"
cat ./_scripts/swagger.json | jq '.info' -c > ./assets/config/dmechatapi.swagger.json
echo "Done"