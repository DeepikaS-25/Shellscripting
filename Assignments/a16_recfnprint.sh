<<doc
Name            : Deepika.S
Date            : 16.06.2022
Description     : Script with recursive function to print each argument passed to the function
Sample execution: Test Case 1:
                  ./recursion.sh How are you? I am fine
                  How
                  are
                  you?
                  I
                  am
                  fine

                  Test Case 2: 
                   ./recursion.sh
                  Error : Pass the arguments through command line.
doc

#!/bin/bash

arr=($@)                            #storing all the arguments in an array
if [ $# -ne 0 ]                     #checking whether arguments are passed or not
then
    function recursive ()           #defining a function
    {   
        echo "$1"                   #printing 1st argument
        arr=(${arr[@]:1})           #removing the element printed using offset
        if [ ${#arr[@]} -eq 0 ]     #return function if array has no elements
        then
            return
        else
         recursive ${arr[@]}        #else function has been called
        fi
    }
recursive $@
else                                #prompting error when no arguments are passed
   echo "Error : Pass the arguments through command line."
fi


