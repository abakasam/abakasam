declare -A path

path[heroku]=/heroku-7.60.2/bin
path[httrack]=/httrack-3.45.1/src
path[iojs]=/iojs-3.3.1
path[npm]=/iojs-3.3.1/cli-2.1.3
path[ionic]=/ionic-1.3.4/bin
path[php]=/php-5.6.5/sapi/cli
path[python]=/python-2.7.5

pathed=""
for binary in "${path[@]}"
do
	# TODO: Argument for local of user
	pathed+=$(pwd)$binary":"
done

# TODO: Use .conf to set PATH for environment
PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin"
#PATH="$PATH$pathed"
PATH="$pathed$PATH"


files=($(find / -name "*bash_profile*" | xargs ls -F))

for file in ${files[@]}
do
	echo "PATH=$PATH" >> $file
	echo "export PATH" >> $file
done
