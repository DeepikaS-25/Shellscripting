<<doc
Name            : Deepika.S 
Date            : 16.06.2022
Description     : script to sort a given number in ascending or descending order
Sample execution:   Test Case 1: 
                    ./sorting.sh -a 5 4 6 2 3 8 9 7 1
                    Ascending order of array is 1 2 3 4 5 6 7 8 9
                    Test Case 2: 
                    ./sorting.sh -d 5 4 6 2 3 8 9 7 1
                    Descending order of array is 9 8 6 5 4 3 2 1
doc

#!/bin/bash
if [ $# -eq 0 ]                 #checking whether arguments are passed
then                            #else prompting error
    echo "Error : Please pass the argument through command line."
    echo "Usage : ./sorting -a/-d 4 23 5 6 3"
else    
    arr=($@)                    #storing arguments in an array
    case $1 in                  #using case for option
        -a) for i in `seq 1 $#` #loop for giving elements
            do
                innerloop=`expr $# - $i - 1`  #assigning loop count to access elements
                for j in `seq 1 $innerloop`
                do
                  if [ ${arr[$j]} -gt ${arr[`expr $j + 1`]} ]   #checking condition for ascending
                  then
                      temp=${arr[$j]}                           #swapping elements
                      arr[$j]=${arr[`expr $j + 1`]}
                      arr[`expr $j + 1`]=$temp
                   fi
                done
            done
            echo "Ascending order of array is ${arr[@]:1}"
              ;;
        -d) for i in `seq 1 $#`
            do
                innerloop=`expr $# - $i - 1`
                for j in `seq 1 $innerloop`
                do
                   if [ ${arr[$j]} -lt ${arr[`expr $j + 1`]} ]   #checking condition for descending
                   then
                      temp=${arr[$j]}
                      arr[$j]=${arr[`expr $j + 1`]}              #swapping elements
                      arr[`expr $j + 1`]=$temp
                   fi
                done
            done
            echo "Descending order of array is ${arr[@]:1}"
                ;;
        *) echo "Error : Please pass the choice."
           echo "Usage : ./sorting -a/-d 4 23 5 6 3"        #prompting error when choice is not specified
                ;;
           esac
fi

