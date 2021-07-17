#!/bin/bash

source my.config

usage()
{
	echo "Upload files to GitHub"
	echo
	echo "Usage: ./save-github.sh <message> --option"
	echo
	echo "options:"
	echo "--help            Show help for save-github"
	echo "--user            Show current user and their email"
	echo "--saving          List files being modified"
}

flags="abcd:"
options="help,user,files,save:"
output=$(getopt -o $flags --long $options)

while true $1
do
	case $1 in
		--help)
			usage
			exit
			;;
		--user)
			git config --list --show-origin
			exit
			;;
		--saving)
			for directory in $directoryproject $directoryuser
			do
				echo $directory
				cd $directory
				git ls-files --stage
		 	done
			exit
			;;
		*)
			break
			;;
	esac
done

message=$1
for directory in $directoryproject $directoryuser
do
	echo $directory
	cd $directory
	git add -A
done
git commit -m "$message"
git push