<<doc
Name                : Deepika.S
Date                : 18.06.2022
Description         : Script to replace 20% lines in a C file randomly and replace it with the pattern
Sample Execution    : ./replace_DEL.sh main.c
                        Before replacing
                        #incude <stdio.h>
                        int main()
                        {
                             printf(“Hello world\n”);
                        }
                        After replacing
                        #incude <stdio.h>
                        int main()
                        {
                        <-----------Deleted------------>
                        }
doc

#!/bin/bash

if [ $# -ne 1 ]                                     #checking whether file name is passed through command line 
then                                                #if not then prompting error
    echo "Error : Please pass the file name through command line."
else
    if [ -f $1 ]                                    #checking whether given is file or not
    then
        if [ -s $1 ]                                #checking whether file has content or not 
        then
            totline=`cat $1 | wc -l`                #finding total lines in a file
            twentypcnt=`expr $totline / 5`          #finding 20% of lines
            echo "Before replacing"
            cat $1
            randomno=`shuf -i 1-$totline -n $twentypcnt`  #finding a random number 
            sed -i "$randomno s/.*/<-----------Deleted------------>/" $1    #replacing the random line and printing pattern
            echo "After replacing"
            cat $1                                  #displaying contents after replacing
        else                                        #error when file has no content
            echo "Error : main2.c is empty file. So can’t replace the string."
        fi
     else                                           #error when such a file has not present
         echo "Error : No such a file."
     fi
fi

