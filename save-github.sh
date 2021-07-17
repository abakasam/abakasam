#!/bin/bash

source my.config

usage()
{
   echo "Upload files to GitHub"
   echo
   echo "Usage: ./save-github --option <message>"
   echo
   echo "options:"
   echo "--help            Show help for save-github"
   echo "--user            Show current user and their email"
   echo "--saving          List files being modified"
}

flags="abcd:"
options="help,user,files,save:"
getopt -o $flags --long $options

echo $1
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
            git add -A
            git ls-files --stage
         done
			exit
			;;
      "")
         message=$2
         git commit -m $message
         git push
         exit
         ;;
  esac
done