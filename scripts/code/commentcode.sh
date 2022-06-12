# TODO: Create options (Complete)

if [[ $1 == "--version" ]]; 
then :
    cat commentcode.version
fi
if [[ $1 == "--help" ]]; 
then :
    cat commentcode.help
fi
if [[ $1 == "--languages" ]]; 
then :
    cat commentcode.languages
fi

# TODO: Parse files (Complete)

language=$1
path=$2
todofile=$3

declare -A streams

streams[js]="console.log(<message>)"
streams[sh]="echo (<message>)"

if [[ ${streams[$language]} == "" ]];
then :
    echo "Langauge, ${language}, not supported"
    exit
fi

cd $path
files=$(ls *.$language)

if [[ $path == "." ]];
then :
    path=$(pwd)
fi

types="TODO IMPROVE REDO BUG MEMORY LEGACY"

declare -a comments
declare -a lines

for file in ${files[@]}
do 
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
        
        if [[ "Complete" == $status ]];
        then :
            # TODO: Mark to be reviewed (Complete)
            line=${line/"Complete"/"Review"}
        fi
        if [[ "Reviewed" == $status ]];
        then :
            # TODO: Convert into console output (Complete)
            line=${streams[$language]/"<message>"/$message}
        fi

        for typed in ${types[@]}
        do
            if [[ $typed == $type ]];
            then :
                comments[${#comments[@]}]="$path/$file $line"
            fi
        done

        read -ra segment <<< $line
        echo "${segment[@]:1}" >> $file
    done

    lines=()
done

# TODO: Create TODO (Complete)

rm $todofile
touch $todofile

for comment in "${comments[@]}"
do
    echo "$comment" >> $todofile
done