<<doc
Name       : Deepika.S
Date       : 15.06.2022
Description: script to perform arithmetic operation on digits of a given number
Sample i/p : ./operator_dependent.sh 1111x
Sample o/p : Multiplication of digits = 1
doc


#!/bin/bash

if [ $# -ne 0 ]             # checking whether command line arguments are passed or not
then                        #if passed 
    num=$@                  #storing argument as a string 
    l=`expr ${#num} - 2`    #assigning and storing to generate sequence for peerforming operations on given digits of number 
    operator=${num: -1}     # finding operator and assiging it to a variable
    sum=${num:0:1}          #initialising sum


    case  $operator  in     #using case for required arithmetic operation
        +) for a in `seq 1 $l`      #for loop to perform addition on digits
           do
           sum=`expr $sum + ${num:$a:1}`  #addition
           done
           echo "Sum of digits = $sum"    #printing result
           ;;
        -) for a in `seq 1 $l`
           do
           sum=`expr $sum - ${num:$a:1}`  #subtraction
           done
           echo "Subtraction of digits = $sum"
           ;;
        x) for a in `seq 1 $l`
           do
           sum=`expr $sum \* ${num:$a:1}` #multiplication
           done
           echo "Multiplication of digits = $sum"
           ;;
        /) for a in `seq 1 $l`
           do                             #division
           sum=`echo "scale=2; $sum / ${num:$a:1}" | bc`
           done
           echo "Division of digits = $sum"
           ;;
        *) echo "Error: Operator missing or invalid operator, please pass operator as last digit (+,-,x,/)"               #default condition to prompt error when operator is missing

      esac

else                                      #prompt errror when arguments are not passed
    echo "Error : Please pass the arguments through CL."
    echo "Usage : ./operator_dependent.sh 2345+"
fi

