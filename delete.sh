#!/bin/bash

for branch in $(git branch -a | sed 's/^\s*//;s/\*//;s/^remotes\///' | grep -v 'master$'); do               
  if [[ "$(git log $branch --since "12 months ago" | wc -l)" -eq 0 ]]; then
    local_branch_name=$(echo "$branch" | sed 's/origin\///')
    echo $local_branch_name
    git branch -D $local_branch_name 
    git push origin --delete $local_branch_name 
  fi
done
