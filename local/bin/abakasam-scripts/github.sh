# TODO: Load login credentials (Complete)

echo "Check your local GitHub configurations (github.config)"
echo "For help: github.sh --help"
echo " "

source github.config
git config --global user.name "$name"
git config --global user.email "$useremail"
git config --global user.signingKey "$password"
git config --global credential.username "$username"

# TODO: Display current repository (Complete)

git config --list
echo " "
echo "^C to avoid save"
echo " "
sleep 3s

# TODO: Create git commands help (Complete)

option=$1

if [[ $option == "--help" || $option == " " ]]
then
	cat github.help
fi

# TODO: Process GitHub option (Complete)

if [[ $option == "--config" ]]
then
	name=$2
	useremail=$3
	password=$4
	username=$5

	git config --global user.name "$name"
	git config --global user.email "$useremail"
	git config --global user.signingKey "$password"
	git config --global credential.username "$username"
fi
if [[ $option == "--commit" ]]
then
	password=$(git config --get user.signingKey)
	username=$(git config --get credential.username)
	URL=$(git config --get remote.origin.url)
	source=$URL

	address=($(echo $URL | tr "/" " "))

	#protocol=${address[0]}
	domain=${address[1]}
	owner=${address[2]}
	repository=${address[3]}

	URL="https://$username:$password@$domain/$owner/$repository"
	echo $URL
	echo "Please check push URL"
	echo " "
	sleep 5s
	
	git config --local remote.origin.url $URL
	git add .
	git commit -m "hello"
	git push
	git config --local remote.origin.url $source
fi
if [[ $option == "--clone" ]]
then
	project=$2
	branch=$3
	
	git clone $project --branch $branch
else
	echo " "
fi
