<<doc
Name       : Deepika.S
Date       : 11.06.2022
Description: Printing length of each and every string using arrays
Sample i/p : bash string_length.sh hello hai how are you?
Sample o/p : Length of string (hello) - 5
             Length of string (hai) - 3
             Length of string (how) - 3
             Length of string (are) - 3
             Length of string (you?) - 4
doc

#!/bin/bash

if [ $# -ne 0 ]      #checking whether command line arguments are passed
then
    arr=($@)         #storing arguments in an array
    for i in `seq 0 ${#arr[@]}`    # creating loop to access each and every element of array
    do  
       if [ ${#arr[i]} -ne 0 ] 
       then
           echo "Length of string (${arr[i]}) - ${#arr[$i]} " #printing element and its size
       fi
   done
else
    echo "Error : Please pass the arguments through command-line."  #else block to prompt error when arguments are not passed
fi

