#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
echo "=================================================="

# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>` or set it in config.yaml

echo "=================================================="
# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
echo "=================================================="

# Come Back
cd ..
