<<doc
Name            : Deepika.S
Date            : 16.06.2022
Description     : Script to count the number of users with user IDs between given range.
Sample execution: 1. ./user_ids.sh
                  Total count of user ID between 500 to 10000 is: 2

                  2. ./user_ids.sh 0 100
                  Total count of user ID between 0 to 100 is : 3

                  3. ./user_ids.sh 100
                  Error : Please pass 2 arguments through CL.
                  Usage : ./user_ids.sh 100 200

                  4. ./user_ids.sh 200 100
                  Error : Invalid range. Please enter the valid range through CL. 
doc

#!/bin/bash

arr=(`cut -d ":" -f3 /etc/passwd`)          #storing all the usernames in an array
if [ $# -eq 0 ]                             #checking whether command line arguents are passed or not
then 
    cout=0                                  #initialising count to 0
    for i in ${arr[@]}
    do  
       if [ $i -gt 500 -a $i -lt 10000 ]    #if arguments are not passed printing no of uids between 500 to 10000
       then
          cout=`expr $cout + 1`
       fi
    done
 echo "Total count of user ID between 500 to 10000 is: $cout"
elif [ $# -eq 2 ]                           #if 2 arguments are passed
then
        if [ $1 -lt $2 ]                    #checking whether it is a valid range
        then
            count=0
            for i in ${arr[@]}              #getting uids one by one using for loop
            do
              if [ $i -gt $1 -a $i -lt $2 ] #checking whether uid is between given limit
              then
                  count=`expr $count + 1`   #count is incremented
              fi
            done
            echo "Total count of user ID between $1 to $2 is: $count" 
         else                               #if entered is invalid range prompting error
          echo "Error : Invalid range. Please enter the valid range through CL."
         fi
else                                        #if argument is neither 0 nor equal to 2 then prompting error and usage
  echo "Error : Please pass 2 arguments through CL."
  echo "Usage : ./user_ids.sh 100 200"
fi

