#!/bin/bash

if [ $# -ne 4 ]; then
cat << ErrorMsg
Wrong number of arguments
expected: 4
got: $#

Provide the following:

    1) Name of application
    2) Application's Github OAuth Client ID
    3) Application's Github OAuth Secret
    4) Name of local branch to push

ErrorMsg

exit 1
fi

readonly application_name=$1
readonly github_oauth_client_id=$2
readonly github_oauth_secret=$3
readonly deploy_branch=$4
