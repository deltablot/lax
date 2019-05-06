#!/usr/bin/env bash

##############################################################################
# clone lax repository.

cd ~/projects || exit
git clone git@github.com:iogf/lax.git lax-code

# push lax.
cd ~/projects/lax-code || exit
git status
git add -- *
git commit -a
git push

# it installs lax.
cd ~/projects/lax-code || exit
sudo bash -i
python2 setup.py install
rm -fr build
exit
##############################################################################
# create, development, branch, lax.
cd ~/projects/lax-code/ || exit
git branch -a
git checkout -b development
git push --set-upstream origin development
##############################################################################
# merge development into master.
cd ~/projects/lax-code/ || exit
git checkout master
git merge development
git push
git checkout development
##############################################################################

cd ~/projects/lax-code || exit
python setup.py sdist register upload
rm -fr dist
