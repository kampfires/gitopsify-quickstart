#!/bin/bash

## Please only enter your custom script processing steps in the Custom_Script_Elements section below, and do not modify other sections of the script
## Whatever functions you execute in the Custom_Script_Elements section below will be processed and push-merged back into the originating pullrequest

## Gather branch name for current pullrequst and declare as CURRENT_BRANCH
CURRENT_BRANCH=$(curl -s https://api.github.com/repos/$REPO_OWNER/$APP_NAME/pulls/$PULL_NUMBER |  jq -r '.head.ref')
echo "CURRENT_BRANCH VALUE IS:"
echo $CURRENT_BRANCH

## create directory for working clone used to process script updates
mkdir /workspace/pr$PULL_NUMBER
git clone $SOURCE_URL
cd $APP_NAME

## checkout branch for current pr
git fetch origin $CURRENT_BRANCH
git checkout $CURRENT_BRANCH

## Custom_Script_Elements: Please enter your custom script elements in this section
echo "echo from the post-pr script"


## add and commit the changes made to the repo and push back into the pullrequest
git add .
git commit -m "pr$PULLNUMBER"
git push origin $CURRENT_BRANCH