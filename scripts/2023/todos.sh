# ./todos.sh <path> <language file extension>
# ./todos.sh . sh

path=$1
language=$2

cd $path

files=$(find $path -name "*.$language")

types=(TODO IMPROVE REDO BUG MEMORY LEGACY)

declare -a comments
declare -a lines

echo "FILES " ${files[@]}

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
# line=${line/"Complete"/"Review"}
#fi
#if [[ "Reviewed" == $status ]];
#then :
# BUG: Last line not read
# TODO: Convert into console output (Complete)
# line="$count ${streams[$language]/"<message>"/$message}"
#fi

for typed in ${types[@]}
do

if [[ "$typed" == "$type" ]];
then :

#echo " "
#echo "COUNT: $count"
#echo "OPERATOR: $operator"
#echo "TYPE: $type == $typed"
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

rm $todofile
touch $todofile

for comment in "${comments[@]}"
do
echo "$comment"
echo "$comment" >> $todofile
