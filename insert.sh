
function insert () {

    echo "which table to insert in?"
    ls
    read ins_in_table
    typeset -i ins_cols=0
    ins_cols=`awk -F";" '{print NF; exit}' $ins_in_table`
    ins_cols=ins_cols-1 
    typeset -i z=0
    typeset -i o=1

	

    while [ $z -le $ins_cols ]
    do
    lolo=`awk -F";" -v"o=$o" '{if(NR==1){print $o}}' $ins_in_table;`
    echo $lolo
    typeset -i hamada=0

    while [ $hamada -eq 0 ]
    do
        echo "enter column name" 
        read 
        if [ $z -eq 0 ]
        then
            if [ ! -z $REPLY ]
            then
                
                PK_values=`awk -F";" '{print $1}' $ins_in_table`
                for i in $PK_values
                do
                    if [ $REPLY == $i ]
                    then 
                        echo "you can't duplicate PK, please try again."
                        insert                                                
                    fi
                done

                echo -n "$REPLY;" >> $ins_in_table
                hamada=hamada+1
                continue

            else
                echo "You won't be able to make insertion without enter your PK "
                echo "Try again"
                echo ""
                insert
        fi
 

        elif [ $z -eq $ins_cols ]
        then    
            echo  "$REPLY" >> $ins_in_table
            hamada=hamada+1
            continue 

        else
            echo -n "$REPLY;" >> $ins_in_table
            hamada=hamada+1
            continue 

        fi

    done
        o=o+1
        z=z+1
    done
}