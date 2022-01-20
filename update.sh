function update_record () {
    echo "enter the table to update"
    read table_to_update
    columns_names=`awk -F";" '{if(NR==2){for ( i=2 ; i<=NF; i++) {print $i}}}' $table_to_update;`

    recordupdate_data=`awk -F";" '{print $1}' $table_to_update`
    echo $recordupdate_data
    echo "enter the pk for record to update."
    read pk_update
    echo $columns_names
    echo "which coulum you want to update ..?"
    read c_name

    #sed -i "$row"'s/^\(\([^:]*:\)\{'"$(($column - 1))"'\}\)[^:]*/\1'"$replace"'/' $table_to_update

    for value in $recordupdate_data
    do

        if [ $value == $pk_update ]
        then
            for w in $columns_names
            do
                indexs=`awk -F";" '{if(NR==2){for ( i=1 ; i<=NF; i++) {if($i=="'$c_name'") {print i}}}}' $table_to_update;`
            done
            echo $indexs
            sed -i '/^10/s//00000/g' DBS/test/moss
        # else
        #     echo "no pk with this name"
        # NR=`awk 'BEGIN{FS=";"}{if ($'$fid' == "'$val'") print NR}' $table_to_update;`
        # oldValue=`awk 'BEGIN{FS="|"}{if(NR=='$NR'){for(i=1;i<=NF;i++){if(i=='$indexs') print $i}}}' $table_to_update;`
        fi
    done

    
}

