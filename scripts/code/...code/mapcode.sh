# TODO: Create options

if [[ $1 == "--version" ]]; 
then :
    #cat commentcode.version
	exit
fi
if [[ $1 == "--help" ]]; 
then :
    cat mapcode.help
	exit
fi

# TODO: Recurse through current directory (Complete)

container=$1
path=$2
listfile=$3

rm $listfile
rm listing
ls -aR "$path" >> listing

declare -a type
type[1]="product	(folders)             "
type[2]="function   (folders / executable)"
type[3]="project    (folder)              "
type[4]="assignment (folder / file)       "
type[5]="task       (file)                "

directory=""
while read line
do
	# TODO: Get the correct depth (Complete)

	if [[ "${line: -1}" == ":" ]];
	then :
		
		# TODO: Create a tree with development comments count by (Complete)
		
		directory=${line/:/}
		location=${directory##*$container}
		IFS="/"; read -ra deep <<< "$location"
		depth=$(expr ${#deep[@]} - 1)
		
		# TODO: Update TODO.see with progress tree (Complete)

		echo "${type[$depth]} $location" >> $listfile
		continue
	fi
	
	if [[ "$line" != "" ]];
	then :
		location=${directory##*$container}/$line
		IFS="/"; read -ra deep <<< "$location"
		depth=$(expr ${#deep[@]} - 1)
		echo "${type[$depth]} $location" >> $listfile
	fi
	
done < listing
rm listing