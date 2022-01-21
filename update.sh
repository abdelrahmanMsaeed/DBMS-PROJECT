function update_record () {
    # gathering information about updates
    echo "enter the table to update" 
    read table_to_update

    #check if the table is there.
    if [ ! -f $table_to_update ]
    then
    echo "*****************************************************"
    echo "*                                                   *"
    echo "*  warning! the table you entered does not existed  *" 
    echo "*                                                   *"
    echo "*****************************************************"  

        DB_menu
    fi

    typeset -i fnumber=1
    columns_names=`awk -F";" '{if(NR==2){for ( i=2 ; i<=NF; i++) {print $i}}}' $table_to_update;`
    col_type=`awk -F";" -v"fnumber=$fnumber" '{if(NR==1){print $fnumber}}' $table_to_update;`

    recordupdate_data=`awk -F";" '{print $1}' $table_to_update`
    echo $recordupdate_data
    echo "enter the pk for record to update."
    read pk_update

    echo $columns_names
    echo "which coulum you want to update ..?"
    read c_name
    
    echo "what is the new value ?"
    read new_value


    typeset -i a=1
    for value in $recordupdate_data
    do
        if [ $value == $pk_update ]
        then
            for w in $columns_names
            do
                indexs=`awk -F";" '{if(NR==2){for ( i=1 ; i<=NF; i++) {if($i=="'$c_name'") {print i}}}}' $table_to_update;`
            done
            old_value=`awk -F";" -v"indexs=$indexs" '{if(NR=="'$a'"){print $indexs}}' $table_to_update;`
            
            `sed -i "/^$value/s/$old_value/$new_value/g" $table_to_update`

        # else
        #   echo "no pk with this name"
        fi
    a=a+1
    done
    
}

