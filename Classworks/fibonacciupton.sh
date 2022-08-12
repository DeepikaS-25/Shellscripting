#!/bin/bash
read -p "Enter value to print fibonaaci :" n
first=0
second=1
next=0
for var in `seq $n`
do
   if [ $next -le $n ]
   then 
       echo "$next"
       first=$second
       second=$next
       next=`expr $first + $second`
    fi  
done

