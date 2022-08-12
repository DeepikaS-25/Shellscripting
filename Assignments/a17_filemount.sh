<<doc
Name                : Deepika.S
Date                : 16.06.2022
Description         : Script to determine whether a given file system or mount point is mounted
Sample execution    : 1. ./mounted_fs.sh /dev/sda2
                        File-system /dev/sda2 is mounted on / and it is having 98% used space with 3298220 KB free.
                      2. ./mounted_fs.sh
                        Error : Please pass the name of the file-system through command line.
doc

#!/bin/bash

if [ $# -ne 0 ]                          #checking whether arguments are passed through command line
then
    count=0                              #initialising count
    index=0                              #initialising index
    arr_file=(`df -h | tr -s " " | cut -d " " -f1`)     #storing Filesystem name in an array
    arr_avail=(`df -h | tr -s " " | cut -d " " -f4`)    #storing available space in an array
    arr_usepcnt=(`df -h | tr -s " " | cut -d " " -f5`)  #storing Use% in an array
    arr_mount=(`df -h | tr -s " " | cut -d " " -f6`)    #storing mount info in an array
    for i in ${arr_file[@]:1}            #creating loop for filesystem name without first name since its not needed
    do    
      index=`expr $index + 1`      #counting index to access values in other arrays
      if [ $1 == $i ]              #checking whether taken filesystem is same as given filesystem
      then
       count=1
       echo "Filesystem $1 is mounted on ${arr_mount[$index]} and it is having ${arr_usepcnt[$index]} used space with ${arr_avail[$index]} free"      fi
    done  
    if [ $count -eq 0 ]                  #if count is 0 then file is not mounted
    then
        echo "$1 is not mounted."
    fi
else                                     #if arguments are not passed then prompting error
    echo "Error : Please pass the name of the file-system through command line."
fi

