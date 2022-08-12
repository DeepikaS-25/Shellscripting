<<doc
Name       : Deepika.S
Date       : 14.06.2022
Description: Script to delete empty lines from a file
Sample i/p : bash delete_empty_lines.sh file.txt
Sample o/p : bash delete_empty_lines.sh file.txt
             Empty lines are deleted
             Hello
             How
             are
             you?
doc

#!/bin/bash

if [ $# -ne 0 ]    #checking whether file name is passed through command line
then               # if passed then deleting emptyn lines
    echo "Empty lines are deleted"
    sed -i '/^[[:space:]]*$/d' $1   # deleting empty lines thruogh sed command
    cat $1                          #displaying contents after deleting empty lines
else               # if file name is not passed through command line then prompting error
    echo "Error: Please pass the file name through command line."
fi

