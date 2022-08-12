<<doc
Name       : Deepika.S
Date       : 10.06.2022
Description: Printing chessboard in black and white colours using echo command
doc

#!/bin/bash


for row in `seq 8`                          # creating loop for row given 8 as chess board has 8 rows and 8 columns
do
    for col in `seq 8`                      # creating loop for column given seq 8 as chessboard has 8 rows and 8 columns
    do  
        a=`expr $row + $col`                # assigning a variable to find even and odd places
        if [ `expr $a % 2` -eq 0 ]          # checking places for odd or even to print colours
        then 
            echo -e -n "\e[47m" " "         # printing black for even places using echo
        else
            echo -e -n "\e[40m" " "         # printing white for odd places using echo
        fi
     done
   echo -e  "\e[0m" " "                     # printing normal to avoid colours in other places
done

