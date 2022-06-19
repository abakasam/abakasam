# TODO: Create options

# --version
# --help

# TODO: Recurse through current directory (Complete)

#path="/home/cabox/workspace/abakasam/scripts"
path=$(pwd)
container="abakasam"

rm TODO.map
rm listing
ls -aR "$path" >> listing

declare -a type
type[1]="function   (folders / executable)"
type[2]="project    (folder)              "
type[3]="assignment (file)                "
type[4]="task       (file / block)        "

directory=""
while read line
do
	# TODO: Get the correct depth (Complete)

	if [[ ${line: -1} == ":" ]];
	then :
		
		# TODO: Create a tree with development comments count by (Complete)
		
		directory=${line/:/}
		location=${directory##*$container}
		IFS="/"; read -ra deep <<< "$location"
		depth=$(expr ${#deep[@]} - 1)
		
		# TODO: Update TODO.see with progress tree (Complete)

		echo "${type[$depth]} $location" >> TODO.map
		continue
	fi
	
	if [[ $line != "" ]];
	then :
		location=${directory##*$container}/$line
		IFS="/"; read -ra deep <<< "$location"
		depth=$(expr ${#deep[@]} - 1)
		echo "${type[$depth]} $location" >> TODO.map
	fi
	
done < listing
rm listing
