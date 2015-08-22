# Middleman Contentful Autobuild

A simple solution combining the simplicity of [Middleman](//middlemanapp.com/) with updateable content through [Contentful](//contentful.com) hosted on (Heroku)[//heroku.com]

## Getting started

To get started clone the project and add ENV for:

```
CONTENTFUL_ACCESS_TOKEN="<contentful access token>"
CONTENTFUL_SPACE="<contentful space id>"
CONTENTFUL_MOCK_ID="<content type id>"

GIT_USER="<git username>"
GIT_REPO="<git repo>"
GIT_BRANCH="<git branch>"

# heroku auth:token
HEROKU_AUTH="<oAuth-token>"
HEROKU_APP="<app name>"
```

This can be done in an `.env` file for your local dev environment.

#### For Dev
`bundle install`
`middleman contentful`
`middleman`

#### To Build
`bundle install`
`rackup`

More information on setup can be found here

(middleman docs)[//middlemanapp.com/basics/install/]
(contentful docs)[//www.contentful.com/developers/docs/]
(contentful_middleman gem)[//github.com/contentful-labs/contentful_middleman]
