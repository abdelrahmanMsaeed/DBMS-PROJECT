function delete_database {
    list_database
    read db_delete
    if [ -d DBS/$db_delete ]
    then 
        rm -r DBS/$db_delete
        echo "$db_delete DataBase has been deleted successfuly"
        main
    else
        echo "no such database called $db_delete, enter 1 to delete or any thing else for main menu."
        select choice in "Delete DB" 
        do
            case $REPLY in
            1)
                delete_database
                ;;
            *)
                main     
                ;;
            esac
        done
    fi    
}

function drop_table {
    echo "which table you want to delete .. ?"
    read dl_file
    if [ -f $dl_file ]
    then 
        rm $dl_file
    else
        echo "There's no table with this name. Enter existing file name ..."
        echo ""
        select choice in 'try again' 'tables menu'
        do
            case $REPLY in
                1)
                    drop_table
                    ;;
                2) 
                    echo "*****************"
                    echo ""
                    DB_menu
                    ;;
                *)
                   echo " you should select from two options only .... "
            esac        
        done
    fi
}

# . ./list.sh