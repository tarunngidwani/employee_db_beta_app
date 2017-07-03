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

# Destroy application if it already exists
heroku apps:destroy ${application_name} --confirm ${application_name}

# Deploys a base application on heroku
heroku create ${application_name}

# Setup config vars on heroku
# These config vars are made available as
# environment variables to our Rails application
heroku config:set GITHUB_ID=${github_oauth_client_id}
heroku config:set GITHUB_SECRET=${github_oauth_secret}

# Deploy Rails application on heroku
git push heroku ${deploy_branch}:master

# Database Setup
heroku pg:reset DATABASE_URL --confirm ${application_name}
heroku run rails db:migrate
heroku run rails db:seed

# Restarts web server serving our Rails application
heroku restart
