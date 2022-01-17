
            #touch file
            #touch file
            #touch_table()
            #ask for number of coulmns
            #ask_numberof_colms()
            #ask type -- ask value
            #ask_pk()
            #ask_types()
            #ask_colms_name()
            #ask primary key
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
    typeset -i cols_len=cols
############################################################################ check type
    typeset -i i=0

    while [ $i -lt $cols_len ]
    do 
        echo "type for the column number (($i+1))"

        select choice in 'string' 'number' 
        do
            case $REPLY in
                1)
                    arr[i]=$REPLY;break
                    ;;
                2)
                    arr[i]=$REPLY;break
                    ;;
                *)
                    echo "Error select option 1 or 2";;
            esac			
        done
        
        array[i]=$REPLY
        i=i+1

    done
    for value in ${array[*]}
    do 
        echo $value
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


