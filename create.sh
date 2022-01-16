
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