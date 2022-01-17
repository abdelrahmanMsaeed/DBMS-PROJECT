
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
    typeset -i hamada=cols

}

