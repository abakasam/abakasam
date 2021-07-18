#!/bin/bash

source my.config
source "$(pwd)/index.sh"
jump $skip

git config --global user.name $username
git config --global user.email $useremail

cd $directoryworking

git clone $userURL
git clone $projectURL

skip:

#wget https://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz
#tar -xf node-v0.12.0.tar.gz
#mv node-v0.12.0.tar.gz node-v0.12.0

wget https://www.python.org/ftp/python/3.4.2/Python-3.4.2.tgz
tar -xf Python-3.4.2.tgz
mv Python-3.4.2.tgz Python-3.4.2