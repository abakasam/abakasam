# ./listtodo.sh <path> <language file extension>
# ./listtodo.sh . sh

language=$2
path=$1

cd $path
pwd

files=$(find $path -name "*.$language")

for file in ${files[@]}
do
echo $file
done


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

for typed in ${types[@]}
do

if [[ "$typed" == "$type" ]];
then :

comments[${#comments[@]}]="$file $line"
fi
done

read -ra segment <<< $line
echo "${segment[@]:1}" >> $file
done

lines=()
done

for comment in "${comments[@]}"
do
echo "$comment"
