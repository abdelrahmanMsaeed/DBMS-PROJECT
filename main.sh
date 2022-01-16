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

 function create_DB {

    echo "enter your DB name"
    read DB_Name
    if [ -d DBS/$DB_Name ]
    then 
        echo "The DataBase called $DB_Name exist"
        main
    else
        mkdir DBS/$DB_Name
    fi
}
 function connect_DB {
   echo "your available DB"
   list_database
   read Connect_DB
   cd DBS/$Connect_DB

}


. ./list.sh

main