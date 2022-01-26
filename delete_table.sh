function delete_record () {
    echo "which table to insert in?"
    ls

    echo "enter the table to delete from"
    read table_to_delte_from

    echo "enter the pk for record to delete."
    read pk_del
    echo ""

    records_data=`awk -F";" '{print $1}' $table_to_delte_from`
    echo $records_data
    echo ""
    echo $pk_del

    for value in $records_data
    do
        if [ $value == $pk_del ]
        then
            sed -i "/^$pk_del/d" $table_to_delte_from
            echo "record deleted"
        fi
    done

    
}

