echo "$LINENO Execute bin.sh in local/bin"

olddirectory=$(pwd)

echo "$LINENO Loading software"

declare -A software

software[scripts]=scripts
software[iojs]=iojs-3.3.1
software[npm]=iojs-3.3.1/deps/npm
software[ionic]=ionic-1.3.4/bin
software[mongosh]=mongosh-1.5.4/bin

LOCAL_PATH=""

echo " "
for directory in "${software[@]}"
do
	echo "Finding $directory $(pwd)/$directory"
	
	LOCAL_PATH+=$(pwd)/$directory:
done
echo " "

echo "$LINENO Setting environment variables"

# TODO: Build multidimensional array for environment variable (Complete)

# IMPROVE: Load variables form file into an array

declare -A variable

#variables["0-1"]="user shell lockup"
#variables["0-2"]=LOCAL_PATH
#variables["0-3"]=$LOCAL_PATH

#variables["1-1"]="gcc C include"
#variables["1-2"]=C_INCLUDE_PATH
#variables["1-3"]=$HOME/local/include

#variables["2-1"]="g++ C++ include"
#variables["2-2"]=CPLUS_INCLUDE_PATH
#variables["2-3"]=$HOME/local/include

variables["3-1"]="clang Obj-C include"
variables["3-2"]=OBJC_INCLUDE_PATH
variables["3-3"]=$HOME/local/include

variables["4-1"]="shell lookup"
variables["4-2"]=PATH
variables["4-3"]=$PATH

variables["5-1"]="user directory"
variables["5-2"]=HOME
variables["5-3"]=$HOME

variables["6-1"]="OS shell executable"
variables["6-2"]=SHELL
variables["6-3"]=$SHELL

variables["7-1"]="mail storage directory"
variables["7-2"]=MAIL
variables["7-3"]=$MAIL

variables["8-1"]="commands recorded"
variables["8-2"]=HISTSIZE
variables["8-3"]=$HISTSIZE

variables["9-1"]="current username"
variables["9-2"]=LOGNAME
variables["9-3"]=$LOGNAME

variables["10-1"]="computer name"
variables["10-2"]=HOSTNAME
variables["10-3"]=$HOSTNAME

# TODO: Add variables array to .bash_profile

echo "$LINENO Adding environment variables to blank .bash_profile"
echo " "

cd
pwd
echo " "
ls -1a .bash_profile_*

echo " "
echo "$LINENO Backing up .bash_profile"

mv $(pwd)/.bash_profile ".bash_profile_$(date)"
cp $olddirectory/bash_profile .bash_profile
echo PATH="${LOCAL_PATH}/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin" >> .bash_profile
echo " " >> .bash_profile
echo " " >> .bash_profile
echo "export PATH" >> .bash_profile

