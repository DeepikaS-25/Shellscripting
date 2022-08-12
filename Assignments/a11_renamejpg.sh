<<doc
Name             : Deepika.S
Date             : 15.06.2022
Description      : Script to rename the jpg files with new name passed through command line
Sample execution : ./rename_album.sh day_out
                   All .jpg files in current directory is renamed as
                   day_out001.jpg day_out002.jpg day_out003.jpg day_out005.jpg day_out004.jpg
doc


#!/bin/bash

echo "Before executing the script"
echo "$ ls"                          
ls                                       #listing contents before executing

arr=(`ls *.jpg`)                         #storing all the jpg files in an array 

if [ $# -ne 0 ]                          #checking whether command line arguments are passed or not
then
  for i in ${arr[@]}                     #for loop for n number of files
  do  
     num=`echo $i | tr -cd [:digit:]`    #extracting only the numbers in filename
     mv $i  $1$num.jpg                   #renaming the imagefile
  done
  echo "All .jpg files in current directory is renamed as"
  ls                                     #listing after execution

else                                     #prompting error if argument is not passed
    echo "Error : Please pass the prefix name through command line."
fi

