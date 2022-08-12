<<doc
Name       : Deepika.S
Date       : 10.06.2022
Description: Read 'n' and generating pattern given
Sample i/p : 4
Sample o/p : 1
             2 3
             4 5 6
             7 8 9 10
doc

#!/bin/bash
read -p "Enter a num:" n   #reading n from the user
x=1                        #assigning and initialize a variable to print pattern
for row in `seq $n`        #creating loop for row
do
    for col in `seq $row`  #creating loop for col
    do  
        echo -n "$x "      #printing the pattern
        x=`expr $x + 1`    #incrementing the variable to print the pattern required 
    done
 echo
done


