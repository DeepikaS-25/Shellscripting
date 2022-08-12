<<doc
Name       : Deepika.S
Date       : 14.06.2022
Description: Script to convert string lower to upper and upper to lower
Sample i/p : bash upper_lower.sh file.txt
Sample o/p : 1 – Lower to upper
             2 – Upper to lower
             Please select option : 1
             WHAT IS OS?
             WHAT ARE THE DIFFERENT OS?
             WHEN IS OS USED?
             WHAT IS PARTITION AND ITS USE?
             HOW MANY PARTITIONS CAN BE DONE?
doc

#!/bin/bash

if [ $# -ne 0 ]        #checking whether command line arguments are passed
then
    if [ -f $1 ]       #if passed then check if file is present are not
    then
        if [ -s $1 ]   #if file is present then check if file has contents in it
        then
            echo "1 – Lower to Upper"               #displaying options
            echo "2 – Upper to Lower"
            read -p "Please select option:" choice  #reading choice of the user
            case $choice in                         #using case to execute the required string change
                1)  cat $1 | tr a-z A-Z             #for lower to upper
                    ;;
                2)  cat $1 | tr A-Z a-z             #for upper to lower
                    ;;
    
            esac                                    #end of case

        else           #printing error if file has no contents
            echo "Error: No contents inside the file."
        fi
    fi
else                  #printing error if file name has not been passed through command line
    echo "Error : Please pass the file name through command line."
fi

    
                                                                                            
