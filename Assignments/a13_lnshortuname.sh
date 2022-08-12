<<doc
Name            : Deepika.S
Date            : 16.06.2022
Description     : Display the longest and shortest user-names on the system
Sample execution: ./largest_username.sh 
                  The Longest Name is: gnome-initial-setup
                  The Shortest Name is:lp
doc


#!/bin/bash

arr=(`cut -d ":" -f1 /etc/passwd`)          #storing all the usernames in an aray
longname=${arr[0]}                          #assigning first element as longest name
shrtname=${arr[0]}                          #assigning first element as shortest name
for i in ${arr[@]}                          #loop to find shortest and longest usernames
do

    if [ ${#i} -gt ${#longname} ]           #if taken username is larger than firstname
    then
        longname=$i                         #longest name is updated with new name
    fi  
    if [ ${#i} -lt ${#shrtname} ]           #if taken username is shorter than firstname
    then
        shrtname=$i                         #shortest name is updated with new name

    fi  
done
echo "The Longest Name is: $longname"      #displaying shortest and the largest name
echo "The Shortest Name is: $shrtname"

