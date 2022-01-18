            #ask value
            #ask_pk()
function touch_table () {
    touch $1
}


function cols_number () {
    echo "Enter your cols number ..."
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

############################################################################ check type

    typeset -i i=0

    while [ $i -le $cols_len ]
    do

        if [ $i -eq $cols_len ]
        then
            echo "type for the column number" 

            select choice in 'string' 'number' 
            do
                case $REPLY in
                    1)
                        echo  "$REPLY" >> $table_name;break
                        ;;
                    2)
                        echo  "$REPLY" >> $table_name;break
                        ;;
                    *)
                        echo "Error select option 1 or 2";;
                esac			
            done
        fi
###

        if [ $i -lt $cols_len ]
        then 
            echo "type for the column number" 

            select choice in 'string' 'number' 
            do
                case $REPLY in
                    1)
                        echo -n "$REPLY;" >> $table_name;break
                        ;;
                    2)
                        echo -n "$REPLY;" >> $table_name;break
                        ;;
                    *)
                        echo "Error select option 1 or 2";;
                esac			
            done
        fi
            i=i+1

    done
    cols_name
}


typeset -i y=0

function cols_name () {

    typeset -i data_cols=0
    data_cols=`awk -F";" '{print NF; exit}' $table_name`
    data_cols=data_cols-1
    echo $data_cols
    
    while [ $y -le $data_cols ]
    do
        echo "enter column name" 
        read
        if [ $y -eq $data_cols ]
        then    
            echo  "$REPLY" >> $table_name
        fi

        if [ $y -lt $data_cols ]
        then
            echo -n "$REPLY;" >> $table_name
        fi
        
        y=y+1
    done


}










































# function check_type () {
#     typeset -i i=0

#     while [ $i -lt $1 ]
#     do 
#         echo "type for the column number (($i+1))"

#         select choice in 'string' 'number' 
#         do
#             case $REPLY in
#                 1)
#                     arr[i]=$REPLY;break
#                     ;;
#                 2)
#                     arr[i]=$REPLY;break
#                     ;;
#                 *)
#                     echo "Error select option 1 or 2";;
#             esac			
#         done
        
#         array[i]=$REPLY
#         i=i+1

#     done
#     for value in ${array[*]}
#     do 
#         echo value
#     done
# }


