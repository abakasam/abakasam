# TODO: Create options (Complete)

# BUG: cat: commentcode.help: No such file or directory

if [[ $1 == "--version" ]]; 
then :
    #cat commentcode.version
	exit
fi
if [[ $1 == "--help" ]]; 
then :
    cat commentcode.help
	exit
fi
if [[ $1 == "--languages" ]]; 
then :
    cat commentcode.languages
	exit
fi

# TODO: Parse files (Complete)

language=$1
path=$2
todofile=$3

declare -A streams

streams[js]="console.log('<message>')"
streams[sh]="echo (\"<message>\")"
streams[!!]="<message>"
streams[md]="##### <message>"

if [[ ${streams[$language]} == "" ]];
then :
    echo "Langauge, ${language}, not supported"
    exit
fi

# TODO: List and grep (Complete)

cd $path
pwd

files=$(find $path -name "*.$language")

if [[ $path == "." ]];
then :
    path=$(pwd)
fi

types=(TODO IMPROVE REDO BUG MEMORY LEGACY)

declare -a comments
declare -a lines

for file in ${files[@]}
do 
	echo $file
	
    while read line
	do
        lines[${#lines[@]}]="${#lines[@]} $line"
    done < $file

    rm $file
    touch $file

    for line in "${lines[@]}"
    do
        IFS=" "
        read -ra segment <<< $line

        count=${segment[0]}
        operator=${segment[1]}
        type=${segment[2]//:/}
        message=${segment[3]}
        status=${line##*(}
        status=${status%%)*}
        
		# TODO: Test more for comment status for console output
        #if [[ "Complete" == $status ]];
        #then :		
            # TODO: Mark to be reviewed (Complete)
        #    line=${line/"Complete"/"Review"}
        #fi
        #if [[ "Reviewed" == $status ]];
        #then :
			# BUG: Last line not read
            # TODO: Convert into console output (Complete)
        #    line="$count ${streams[$language]/"<message>"/$message}"
        #fi

        for typed in ${types[@]}
        do			
		
            if [[ "$typed" == "$type" ]];
            then :
			
				#echo " "
				#echo "COUNT:        $count"
				#echo "OPERATOR:     $operator"
				#echo "TYPE:         $type == $typed"
				#echo " "
				
                comments[${#comments[@]}]="$file $line"
            fi
        done

        read -ra segment <<< $line
        echo "${segment[@]:1}" >> $file
    done

    lines=()
done

# TODO: Create TODO (Complete)

for comment in "${comments[@]}"
do
	echo "$comment"
done