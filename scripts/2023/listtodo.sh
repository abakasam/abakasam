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
