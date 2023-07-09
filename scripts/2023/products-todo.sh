# ./todo-products.sh <path> <product extension>
# ./todo-products.sh /home/cabox/workspace/abakasam tgz >> PRODUCTS

extension=$2
path=$1

cd $path

cat products.types

products=$(find $path -name "*.$extension")

for product in ${files[@]}
do
  echo $product
done