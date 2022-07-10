declare -A path

path[heroku]=/heroku-7.60.2/bin
path[httrack]=/httrack-3.45.1/src
path[iojs]=/iojs-3.3.1
path[npm]=/cli-2.1.3
path[ionic]=/ionic-1.3.4/bin
path[php]=/php-5.6.5/sapi/cli
path[python]=/python-2.7.5

pathed=""
for binary in "${path[@]}"
do
	pathed+=":"$(pwd)$binary
done

#PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin" # CodeAnywhere CentOS 7.2.1511
#PATH="${PATH}:${pathed}"
PATH=$pathed
exit

files=($(find / -name "*bash_profile*" | xargs ls -F))

for file in ${files[@]}
do
	sed -i "1c PATH=$PATH" $file
done
