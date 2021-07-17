#!/bin/bash

optionshelp()
{
   echo "Save current progress to GitHub"
   echo
   echo "Syntax: ./save-github [-g|r|a|c] <commitmessage>"
   echo "options:"
   echo
   echo "h     Print script help"
   echo "r     See username, email, and repository in use"
   echo "a     See added"
   echo "c     See commit"
}

while getopts ":hrn:" option; do
   case $option in
      h)
         optionshelp
         exit;;
      r)
         git config --list --show-origin
         exit;;
      n)
         exit;;
         # Name=$OPTARG;; Wait for input and store in bash variable
     \?)
         echo "Error: Invalid option"
         exit;;
   esac
done

commitmessage=$1
echo $commitmessage

git add -A $directoryproject
git status
exit 0
git commit $commitmessage