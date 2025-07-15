#!/bin/bash


<< disclaimer
"In this we will be learning conditional operators"
disclaimer


read -p "enter the gender: " gender

if [[ $gender == "male" ]];
then
	echo "gender is male"
else
	echo "gender is female"
fi




