<<doc
Name       : Deepika.S
Date       : 14.06.2022
Description: Script to print contents of a directory without ls command
Sample i/p : bash ouput_ls.sh ~ ~/ECEP
SAmple o/p :
/home/user:
Downloads Documents Desktop Music Pictures Public Videos
ECEP
doc

#!/bin/bash

if [ $# -eq 0 ]            # checking whether command line arguments are passed
then
    echo *                 #if not passed then print contents of current working directory
else                       #if passed then checking how many directories are passed
    for dir in $@          #creating loop for printing list of all command line arguments
    do  
        if [ -d $dir ]     #checking whether given argument is directory or not
        then    
             cd $dir       #if directory then change to given directory
             echo "$dir:"
             echo *        #prints contents of directory
    
        else              #if argument is not directory then error is printed
    
             echo " Cannot access ‘$dir’ : No such a file or directory."
        fi
    done
fi

