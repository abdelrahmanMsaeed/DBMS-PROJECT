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


# . ./list.sh