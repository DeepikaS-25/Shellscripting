<<doc
Name                    : Deepika.S
Date                    : 17.06.2022
Description             : Script to display the number of executable files in each directory of $PATH
Sample execution        : Current dir: /usr/local/sbin
                            current count is 0
                            Current dir: /usr/local/bin
                            current count is 0
                            Current dir: /usr/sbin
                            current count is 166
                            Current dir: /usr/bin
                            current count is 1224
                            Current dir: /sbin
                            current count is 152
                            Current dir: /bin
                            current count is 142
                            Current dir: /usr/games
                            current count is 1
                            Current dir: /usr/local/games
                            current count is 0
                            Current dir: /opt/microchip/xc8/v2.20/bin
                            current count is 6
                            Current dir: /opt/microchip/xc8/v2.20/bin
                            current count is 6
                            Total - 1697

doc

#!/bin/bash

arr=(`echo $PATH | tr ":" " "`)            #storing the directories of $PATH in an array        
tot_count=0                                #assigning the total count as 0

for dir in ${arr[@]}                       #creating loop to access all the directories one by one
do
  count=0
  if [ -d "$dir" ]                         #checking whether it is directory or not
  then
       cd $dir                             #if yes go to that directory
       arr2=(`ls -a`)                      #storing contents of the directory into an array
       for file in ${arr2[@]}
       do
         if [  -f "$file" ]
         then                             #checking all the files and for only executable files incrementing count
            if [ -x "$file" ]
            then
              count=`expr $count + 1`     #evaluating count of exe files
            fi
          fi
        done
     echo "Current dir: $dir"             #printing current dir
     echo "current count is $count"       #printing count
  fi
   tot_count=`expr $count + $tot_count`   #evaluating total count
done
echo "Total - $tot_count"                 #printing total count

