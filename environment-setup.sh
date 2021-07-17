#!/bin/bash

source my.config

git config --global user.name $username
git config --global user.email $useremail

git clone $userURL
git clone $projectURL