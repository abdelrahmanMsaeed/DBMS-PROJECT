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


###############################################################################


function DB_menu {
select choice in 'Create Table' 'List Tables' 'Drop Table' 'Select From Table' 'Insert into Table' 'Delete From Table' 'Update Table' 
do
	case $REPLY in
		1)
			create_table
            ;;
		2)
			
            ;;
		3)
		    
            ;;
        4)
            
            ;;

        5)            
            ;;
        
        6) 
            ;;
        
        7) 
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

function create_table {
     
        echo " Enter your table name you want to create ... "
        read table_name 
        if [ -f $table_name ]
        then
            echo "this table is already exist"
            DB_menu
        else
            #touch file

            touch_table $table_name
            #ask for number of coulmns
            cols_number

            #ask type -- ask value

            #ask primary key
             
        fi
}





###############################################################################













. ./create.sh
. ./delete.sh
. ./connect.sh
. ./list.sh
. ./table_funs.sh
main