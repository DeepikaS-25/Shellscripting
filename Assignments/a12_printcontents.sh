<<doc
Name         : Deepika.S
Date         : 13.06.2022
Description  : Script to print contents of file from given line number to next given number of lines
Sample input : print_lines.sh 5 3 myfile.txt
Sample output: line number 5
               line number 6
               line number 7
doc
#!/bin/bash

if [ $# -eq 3 ]              #checking whether command line arguments are passed
then
    totlines=`cat $3 | wc -l`   #counting total lines in text file 
    noflines=`expr $1 + $2 - 1`         #counting lines to be printed

      if [ $totlines -ge $noflines ]      #checking whether file has sufficient no of lines to print
      then
         echo "`head -$noflines $3 | tail -$2`"  #printing lines
      else                                                #if file  doesn't have required number of lines then printing error 
        echo "Error: data.txt is having only 10 lines." 
        echo "file should have atleast 14 lines" 
      fi

else                                                    #if required command line arguments are not passed then print error
   echo "Error: arguments missing!"
   echo "Usage: ./file_filter.sh start_line upto_line filename"
   echo "For eg. ./file_filter.sh 5 5 <file>"
fi

