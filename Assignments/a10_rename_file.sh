<<doc
Name             : Deepika.S
Date             : 15.06.2022
Description      : Script to rename a file replaced by lower and directory by upper case letters
Sample execution : Before running the script
                   $ ls
                   File.txt MyScript.SH MyFile007.txt dir/ Assign1/ newfolder/
                   $ ./file_upper_lower.sh
                   Files are rename in lowercase and directories are renamed in upper case
                   $ ls
                   file.txt myfile007.txt myscript.sh DIR/ ASSIGN1/ NEWFOLDER/
doc

#!/bin/bash
arr=(`ls`)                               #storing the contents in an array
echo "Before running the script"
echo "$ ls"                              
ls                                       #printing the contents using ls command
for i in ${arr[@]}                       #creating loop to access contents one by one 
do
    if [ -f $i ]                         # checking whether element is file
    then
        file=`echo $i | tr A-Z a-z`      #if file then changing from upper to lower
      if [ $i != $file ]                 #changing file name only if filename is not in lower case letters
      then
         mv $i $file
      fi  
    elif [ -d $i ]                       # checking whether element is dir
    then
        dir=`echo $i | tr a-z A-z`       #if dir then changing from lower to upper
      if [ $i != $dir ]
      then
        mv $i $dir                       #changing dir name only if dirname is not in upper case letters
      fi
    fi
done
echo
echo "Files are rename in lowercase and directories are renamed in upper case"
echo "$ ls"
ls                                      #printing contents after renaming

