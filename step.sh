#!/bin/bash
set -e
set -x
set -o pipefail
curl -u "$browserstack_username:$browserstack_access_key" -X POST https://api-cloud.browserstack.com/app-automate/upload -F "file=@$upload_path" -F 'data={"custom_id": "'$custom_id'"}' | jq -j '.app_url' | envman add --key BROWSERSTACK_APP_URL
echo $BROWSERSTACK_APP_URL
git clone https://github.com/SiddhiRao10/python-appium-app-browserstack.git
cd bstack-robot-framework
pip install robotframework
pip install --upgrade robotframework-seleniumlibrary
pip install robotframework-pabot
pip install robotframework-appiumlibrary
cd app/test
robot Appium_android.robot
