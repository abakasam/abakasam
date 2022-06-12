array=(workspace abakasam scripts code)
y="${array[*]}"
echo $y
x=/${y// //}
echo $x