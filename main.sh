#!/bin/bash 

echo "Select Option From The Next Menu: "



function main {
select choice in 'Create DataBase' 'List DataBase' 'Connect To Database' 'Drop DataBase'
do
	case $REPLY in
		1)
			create_DB
            ;;
		2)
			list_database
            ;;
		3)
		    connect_DB
            ;;
        4)
            delete_database
            ;;
		*)
			echo "you did'n choose option from the previos ones,are you sure you want to exit?"
            echo 'enter "y" to exit and anything else to main menu'
            read ans
            if [ $ans = "y" ] || [ $ans = "Y" ]
            then
                exit 0
            else
                main
            fi
            ;;
	esac			
done
}

. ./create.sh
. ./delete.sh
. ./connect.sh
. ./list.sh

main