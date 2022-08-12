<<doc
Name            : Deepika.S 
Date            : 16.06.2022
Description     : script to print system information using commands
Sample execution:./system_info.sh
                   1. Currently logged users
                   2. Your shell directory
                   3. Home directory
                   4. OS name & version
                   5. Current working directory
                   6. Number of users logged in
                   7. Show all available shells in your system
                   8. Hard disk information
                   9. CPU information.
                  10. Memory Informations
                  11. File system information.
                  12. Currently running process.
                   Enter the choice : 2
                   Your shell directory is /bin/bash
                   Do you want to continue (y/n) ?
doc

#!/bin/bash
option="y"                              #assigning option for repeated operation
while [ $option = "y" ]                 #while option is y then perform operation again
do
    echo "1. Currently logged users"    #displaying menu
    echo "2. Your shell directory"
    echo "3. Home directory"
    echo "4. OS name & version"
    echo "5. Current working directory"
    echo "6. Number of users logged in"
    echo "7. Show all available shells in your system"
    echo "8. Hard disk information"
    echo "9. CPU information."
    echo "10. Memory Informations"
    echo "11. File system information."
    echo "12. Currently running process."
    read -p "Enter the choice :" choice    #reading choice from the user
  case $choice in                          #using case to perform specified operation
    1) echo "currently logged users are:"
       echo `who`
    ;;
    2) echo "Your shell directory is:"
       echo $SHELL
    ;;
    3) echo "Home directory is:"
       echo  $HOME
    ;;
    4) echo "username and version is"
       echo "`uname -s` and `uname -v`"
    ;;
    5) echo "Current working directory is:"
       echo `pwd`
    ;;
    6) echo "Number of users logged in is:"
       echo `whoami | wc -l`
    ;;
    7) echo "Available shells in your system is:"
        cat /etc/shells
    ;;
    8) echo "Hard disk information:"
       echo `hwinfo`
    ;;
    9) echo "CPU information:"
        cat /proc/cpuinfo
    ;;
    10) echo "Memory information:"
        cat /proc/meminfo
    ;;
    11) echo "Filesystem information is:"
        echo `df`
    ;;
    12) echo "Currently running processes are:"
        echo `ps`
    ;;
    *) echo "Error : Invalid option, please enter valid option"   #Default option to prompt error when entered choice is other than menu
  esac
      echo "Do you want to continue (y/n) ?" 
      read option
done
