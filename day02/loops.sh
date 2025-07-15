#!/bin/bash

# for loop
for (( num=0 ; num<5 ; num++ ))
do
	echo "the number is $num"
done

echo "now we will print number using while loop"

i=0

while [[ i -le 5 ]]
do
	echo "the number is $i "
	((i++))

done 





