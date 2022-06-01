#!/bin/bash



#05:00:00 AM
#08:00:00 AM
#02:00:00 PM
#08:00:00 PM
names=$(head -1 Roulette_Losses | awk '{for(i=4;i<=NF;i++) printf $i" "; print ""}')
#while read line;do 
#	names=$(echo $line | awk '{for(i=4;i<=NF;i++) printf $i" "; print ""}')
#	echo $names
IFS=","
 #       _5am_t=0
no_of_loss_time=$(cat Time_Loss_Occur.txt | wc -l)
:>Notes_Player_Analysis
for n in $names
do
name=$(echo "$n" | sed -e 's/^ //')
#echo $name
count=0
while read _time;do
	name_match_times=$(grep $name Roulette_Losses | grep $_time | wc -l)
	if [ "$name_match_times" -ge "$no_of_loss_time" ];then
		echo "$_time	$name	$name_match_times" >> Notes_Player_Analysis
		#count=$(($count + 1))
	fi
done < Time_Loss_Occur.txt 
if [ "$count" -ge "$no_of_loss_time" ];then
	echo "$name	$count"
fi

	#	_5am=$(grep $name Roulette_Losses | grep "05:00:00 AM" | wc -l)
	#	_5am_t=$(($_5am_t + $_5am))
done
	#echo $_5am_t;
#exit	
#done < Roulette_Losses
