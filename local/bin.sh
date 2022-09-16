user="abakasam"

echo "Loading software"
declare -A software

software[abakasam-scripts]=abakasam-scripts
software[iojs]=iojs-3.3.1
software[npm]=cli-2.1.3
software[ionic]=ionic-1.3.4/bin
software[mongosh]=mongosh-1.5.4/bin

LOCAL_PATH=""

for directory in "${software[@]}"
do
	echo "Loading $directory"
	LOCAL_PATH+="$(pwd)/$user/$directory:"
done

echo "Setting environment variables"
variables=("user shell lockup" $LOCAL_PATH LOCAL_PATH)
variables+=("gcc C include path" $HOME/local C_INCLUDE_PATH)
#variables+=("g++ C++ include path" $HOME/local CPLUS_INCLUDE_PATH)
#variables+=("clang Obj-C include path" $HOME/local OBJC_INCLUDE_PATH)
#variables+=("shell lookup" $PATH PATH)
#variables+=("user directory" $HOME HOME)
#variables+=("OS shell executable" $SHELL SHELL)
#variables+=("mail storage directory" $MAIL MAIL)
#variables+=("commands recorded" $HISTSIZE HISTSIZE)
#variables+=("current username" $LOGNAME LOGNAME)
#variables+=("computer name" $HOSTNAME HOSTNAME)

for((index=0; $index < ${#variables[@]}; index++))
do
	description=${variables[$index]}
	path=${variables[$index + 1]}
	variable=${variables[$index + 2]}
	index+=2
	
	echo $variable
	echo $path
	echo $description
done

exit

echo "Adding environment variables (.bash_profile)"
cd $HOME
CONTENT=$(cat $HOME/.bash_profile)
CONTENT=$(cat $HOME/.bash_profile_old)
mv .bash_profile .bash_profile_old
rm .bash_profile
touch .bash_profile
echo $VARIABLES >> .bash_profile
echo $CONTENT >> .bash_profile
