
# TODO: Display current repository

git config --list
echo " "
echo "^C to avoid save"
sleep 3s

# TODO: Create git commands help

option=$1

if [[ $option == "--help" || $option == " " ]]
then
	cat github.help
fi

# TODO: Process GitHub option

if [[ $option == "--config" ]]
then
	name=$2
	useremail=$3
	password=$4
	username=$5

	git config --global user.name $name
	git config --global user.email $useremail
	git config --global user.signingKey $password
	git config --global credential.username $username
fi
if [[ $option == "--commit" ]]
then
	password=$(git config --get user.signingKey)
	username=$(git config --get credential.username)
	URL=$(git config --get remote.origin.url)

	address=($(echo $URL | tr "/" " "))  

	protocol=${address[0]}
	domain=${address[1]}
	owner=${address[2]}
	repository=${address[3]}

	URL="git+ssh://$username:$password@$domain/$owner/$repository"
	echo $URL
	echo "Please check push URL"
	sleep 3s

	git config --local remote.origin.url https://abakasam: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@github.com/abakasam-development/ionic.git
	
	git add .
	git commit -m "hello"
	git push
fi
if [[ $option == "--clone" ]]
then
	project=$2
	branch=$3
	
	git clone $project --branch $branch
fi
