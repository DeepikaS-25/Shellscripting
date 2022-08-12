<<doc
 Name       : Deepika.S
 Date       : 10.06.2022
 Description: Arithmetic calculator through command line arguments
 Sample i/p : bash arithmatic_calc.sh 12 + 18
              bash arithmatic_calc.sh 22 x 30
              bash arithmatic_calc.sh 36 / 6
              bash arithmatic_calc.sh 2.5 - 1.2 
              bash arithmatic_calc.sh 
              bash arithmatic_calc.sh 40 
              bash arithmatic_calc.sh 20 2

 Sample o/p : bash arithmatic_calc.sh 12 + 18 --> 12 + 18 = 30
              bash arithmatic_calc.sh 22 x 30 --> 22 x 30 = 660
              bash arithmatic_calc.sh 36 / 6 -->  36 / 6  = 6.00
              bash arithmatic_calc.sh 2.5 - 1.2 --> 2.5 - 1.2 = 1.3
              bash arithmatic_calc.sh --> Error:Please pass the arguments through command line.
                                          Usage:./arithmatic_calc.sh 2.3 + 6.7
              bash arithmatic_calc.sh 40 --> Error:Please pass 3 arguments.
                                             Usage:./arithmatic_calc.sh 2.3 + 6.7
              bash arithmatic_calc.sh 20 2 --> Invalid operator

doc






#!/bin/bash



if [ $# -eq 0 ] #Checking whether command line arguments are passed

then
    
    echo "Error : Please pass the arguments through command line."

    echo "Usage:./arithmatic_calc.sh 2.3 + 6.7"



   
elif [ $# -lt 3 ] # Checking whether 3 arguments are passed 
then
       
    echo "Error:Please pass 3 arguments."
    
    echo "Usage:./arithmatic_calc.sh 2.3 + 6.7"
   
   

else # The user has entered the correct input



       case $2 in # $2 is passed as arithmetic operator by the user



            +) sum=`echo "$1 + $3" | bc` # Addition  

                 echo "$1 $2 $3 = $sum"

                  ;;



            -) sub=`echo "$1 - $3" | bc` # Subtraction

                 echo "$1 $2 $3 = $sub"

                  ;;



            x) mul=`echo "$1 * $3" | bc` # Multiplication

                 echo "$1 $2 $3 = $mul"

                  ;;



            /) div=`echo "scale = 2; $1 / $3" | bc` # Division

                 echo "$1 $2 $3 = $div"

                  ;;



            *) echo "Invalid operator" # Default case

                  ;;

         
         esac

  fi


