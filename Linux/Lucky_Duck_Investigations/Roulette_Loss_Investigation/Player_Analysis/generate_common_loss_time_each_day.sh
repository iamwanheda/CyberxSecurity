#!/bin/bash
file_string=""
i=0
previous_file=""
unique_file=""
for file in *_win_loss_player_data;do
	awk '{if(substr($3,1,1)=="-") print $1,$2}' $file  > ${file}_time
	
	#awk '{print $1,$2}' $file | sort -u > ${file}_time
	if [[ $previous_file != ""  ]];then
		comm -1 -2 $previous_file  ${file}_time > unique_file
		unique_file=$previous_file
	fi	
	if [[ $unique_file != ""  ]];then
		previous_file=$unique_file
	else
		 previous_file=${file}_time	
        
	fi

#rm -fr ${file}_time
done
cat unique_file > Time_Loss_Occur.txt
rm -fr unique_file
#echo $file_string
#comm -1 -2 $file_string 
