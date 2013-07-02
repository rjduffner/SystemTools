#!/bin/bash

#
# Edited for site by Robert Duffner
# Credit to kenorb of Drupal forms for base code
# Adding Git Comment
#

curl https://github.com/rjduffner?tab=repositories | perl -nle 'print "$2" if /(<a href=.*rjduffner\/(.*)">.*<\/a>)/' >project_list.txt
do
  echo $project
  if [ ! -d $project/.git ]; then
    if [ -d $project ]; then
      rm -rf $project
    fi
    git clone https://github.com/rjduffner/$project.git
  else
    git --git-dir=$project/.git --work-tree=$project fetch
  fi
done
