#!/bin/bash

source my.config
source "$(pwd)/index.sh"

git config --global user.name $username
git config --global user.email $useremail

cd $directoryworking

git clone $userURL
git clone $projectURL

exit

packagenode="v0.12.18"
wget https://nodejs.org/dist/$packagenode/node-$packagenode.tar.gz
tar -xf node-$packagenode.tar.gz
mv node-$packagenode.tar.gz node-$packagenode

packagepython="2.7.9"
export PYTHON="${directoryuser}/environment-setup/Python-$packagepython/python"
$PYTHON ./node-$packagenode/configure --without-snapshot
cd $directoryuser/environment-setup/node-$packagenode/
make
make install