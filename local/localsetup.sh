environment=$1

# TODO: Add to PATH environment variable
IFS=":"
read -ra location <<< "$PATH"

for path in "${location[@]}"
do
	echo "$path"
done

# TODO: Install software