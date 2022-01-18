function insert () {

    echo "which table to insert"
    ls
    read ins_in_table
    typeset -i ins_cols=0
    ins_cols=`awk -F";" '{print NF; exit}' $ins_in_table`
    ins_cols=ins_cols-1 
    typeset -i z=0
    while [ $z -le $ins_cols ]
    do
        echo "enter column name" 
        read
        if [ $z -eq 0 ]
        then
            if [ ! -z $REPLY ]
            then
                echo -n "$REPLY;" >> $ins_in_table
            else
                echo "You won't be able to make insertion without enter your PK "
                echo "Try again"
                echo ""
                insert
            fi
 

        elif [ $z -eq $ins_cols ]
        then    
            echo  "$REPLY" >> $ins_in_table
        else
            echo -n "$REPLY;" >> $ins_in_table
        fi
        z=z+1
    done
}