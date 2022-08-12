<<doc
Name            : Deepika.S 
Date            : 16.06.2022
Description     : Script to print greetings based on time
Sample execution: When we start shell (whenever you opening new tab or terminal)
                  Good Morning user, Have nice day!
                  This is Thursday 16 in June of 2022 (06:54:10 PM) 
doc

#!/bin/bash

hour=`date | cut -d " " -f4 | cut -d ":" -f1`   #getting hour from date command
tym=`date +%r | cut -d " " -f1`                 #getting time (hh:mm:ss) format to print
tym1=`date +%r | cut -d " " -f2`                #am or pm
day=`date +%A`                                  #day
date=`date | cut -d " " -f3`                    #date
year=`date | cut -d " " -f6`                    #year
month=`date +%B`                                #month
if [ $hour -ge 5 -a $hour -lt 12 ]              #conditions for morning 5 to 12
then
    echo "Good Morning user, Have nice day!"
elif [ $hour -ge 12 -a $hour -lt 14 ]           #conditions for noon 12 to 14
then
    echo "Good noon user, Have nice day!"       
elif [ $hour -ge 14 -a $hour -lt 17 ]           #conditions for afternoon 14 to 17
then
    echo "Good afternoon user, Have nice day!"  
elif [ $hour -ge 17 -a $hour -lt 21 ]           #conditions for evening 17 to 21
then
    echo "Good evening user, Have nice day!"
else                                            #else good night
    echo "Good night user, Have nice day!"
fi

echo "This is $day $date in $month of $year ($tym $tym1)" #adding time date year month day 

#open .bashrc file and add bash / followed by the absolute path of this script and scriptname also in the last line and save to see the greeting everytime when opening a terminal

