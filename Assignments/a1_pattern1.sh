<<doc
Name       : Deepika.S
Date       : 09.06.2022
Description: Read 'n' and generating pattern given
Sample i/p : 4
Sample o/p : 1
             1 2
             1 2 3
             1 2 3 4
doc

#!/bin/bash

read -p "Enter a num:" n   #reading n from the user
for row in `seq $n`        #creating loop for row
do
    for col in `seq $row`  #creating loop for col
    do
        echo -n "$col "   # printing the pattern
    done
 echo
done

