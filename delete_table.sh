function delete_record () {
    echo "enter the table to delete from"
    read table_to_delte_from

    echo "enter the pk for record to delete."
    read pk_del

    records_data=`awk -F";" '{print $1}'` $table_to_delte_from

    echo $records_data
    echo $pk_del
    for value in $records_data
    do
        if [ $value == $pk_del ]
        then
            `sed '/$value/d' table_to_delte_from`
            echo "record deleted"
        else
            echo "no pk with this name"
        fi
    done
    
}