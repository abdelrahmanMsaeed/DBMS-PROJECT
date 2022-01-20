function select_table () {
    echo "wich table to select from"
    read table_info

    recorded_data=`awk -F";" '{print $1}' $table_info`
    echo $recorded_data
    echo "enter the pk for record to display."
    read pk_display


    for value in $recorded_data
    do
        if [ $value == $pk_display ]
        then
            #sed -i "/$pk_del/d" $table_to_delte_from
           # sed -i "/^$pk_del\b/Id" $table_to_delte_from
            sed -n "/^$pk_display/p" $table_info
            #sed -i "0,/$pk_del/{/$pk_del/d;}" $table_to_delte_from
        fi
    done

    
}