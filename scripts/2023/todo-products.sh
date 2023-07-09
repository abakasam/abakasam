# ./todo-products.sh <path> <language extension>
# ./todo-products.sh . sh >> TODO
# ./todo-products.sh /home/cabox/workspace/abakasam/blog log >> TODO

language=$2
path=$1

cd $path

files=$(find $path -name "*.$language")

declare -a lines

for file in ${files[@]}
do
  while read line
  do
    lines[${#lines[@]}]="${#lines[@]} $line"
  done < $file
done

types=(TODO IMPROVE REDO BUG MEMORY LEGACY)
declare -a comments

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
      #comments[${#comments[@]}]="$file $line"
      comments[${#comments[@]}]="$line $file"
    fi
  done

done

for comment in "${comments[@]}"
do
  echo "$comment"
done