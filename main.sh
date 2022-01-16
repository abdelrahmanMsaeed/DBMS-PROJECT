#!/bin/bash 

echo "Select Option From The Next Menu: "



function main {
select choice in 'Create DataBase' 'List DataBase' 'Connect To Database' 'Drop DataBase'
do
	case $REPLY in
		1)
			ls $1
            ;;
		2)
			list_database
            ;;
		3)
			echo exiting
            exit 0
            ;;
        4)
            delete_database
            ;;
		*)
			echo "Error select option 1..3"
            ;;
	esac			
done
}

function delete_database {
    if [ $# -eq 0 ]
    then
        echo "witch DB to delete?"
        ls DBS/
        read
        rm -r DBS/$REPLY
        echo "$REPLY has been Deleted!"
    fi
}

. ./list.sh

main