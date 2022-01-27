
# create table
function touch_table () {
    touch $1
}


# metadata = how many columns and it's type
function cols_number () {
    echo "Enter How many columns you want ... "
    read  cols
    re='^[0-9]+$'
    if ! [[ $cols =~ $re ]]
    then
        echo "error: Not a number"
        cols_number
    else
        echo "okay your DB will have $cols coulmns"
    fi
    typeset -i cols_len=$cols
    cols_len=cols_len-1
    typeset -i i=0

    t=""
    n=""


    echo "***************************************************"
    echo "*                                                 *"
    echo "*  warning!: the first column will be your (PK)   *" 
    echo "*                                                 *"
    echo "***************************************************"    

################################### check type ###############################

    while [ $i -le $cols_len ]
    do

        if [ $i -eq $cols_len ]
        then
            echo "type for the column number" 

            select choice in 'string' 'number' 
            do
                case $REPLY in
                    1)
                        # echo  "string" >> $table_name;break
                        t="${t}string";break
                        ;;
                    2)
                        # echo  "number" >> $table_name;break
                        t="${t}number";break
                        ;;
                    *)
                        echo "Error select option 1 or 2";;
                esac			
            done
            else
            echo "type for the column number" 

            select choice in 'string' 'number' 
            do
                case $REPLY in
                    1)
                        # echo -n "string;" >> $table_name;break
                        t="${t}string;";break
                        ;;
                    2)
                        # echo -n "number;" >> $table_name;break
                        t="${t}number;";break

                        ;;
                    *)
                        echo "Error select option 1 or 2";;
                esac			
            done
        fi
            i=i+1

    done
    echo $t >> $table_name
    cols_name
}


typeset -i y=0


# columns metadata = columns name
function cols_name () {
    

    typeset -i data_cols=0
    data_cols=`awk -F";" '{print NF; exit}' $table_name`
    data_cols=data_cols-1
    
    while [ $y -le $data_cols ]
    do
        echo "enter column name" 
        read
        if [ $y -eq $data_cols ]
        then    
            echo  "$REPLY" >> $table_name
        else
            echo -n "$REPLY;" >> $table_name
        fi
        y=y+1
    done
        echo "*****************************************************************"
        echo "*                                                               *"
        echo "     your $table_name table  has been added successfully     " 
        echo "*                                                               *"
        echo "*****************************************************************" 

}


