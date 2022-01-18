function DB_menu {
select choice in 'Create Table' 'List Tables' 'Drop Table' 'Select From Table' 'Insert into Table' 'Delete From Table' 'Update Table' 
do
	case $REPLY in
		1)
			create_table
            DB_menu
            ;;
		2)
			list_table
            DB_menu
            ;;
		3)
		    drop_table
            DB_menu
            ;;
        4)
            
            ;;

        5)            
            ;;
        
        6) 
            ;;
        
        7) 
            ;;
    
		*)
			echo "you did'n choose option from the previos ones,are you sure you want to exit?"
            echo 'enter "y" to exit and anything else to main menu'
            read ans
            if [ $ans = "y" ] || [ $ans = "Y" ]
            then
                exit 0
            else
                main
            fi
            ;;
	esac			
done
}