#!/bin/bash
base_dir="../Dealer_Analysis"
_date=$1
_time=$2" "$3
_game=$4
if [[   -z  $1  ]] || [[   -z  $2  ]] || [[   -z  $4  ]] ;then
       	echo "Please run the script with <date> <time> <game>. Ex: ./roulette_dealer_finder_by_time 0310 10:00:00 AM BlackJack"
	exit
fi

if [[ $_game = "BlackJack"  ]];then
	grep --no-filename  "$_time" $base_dir/${_date}_Dealer_schedule | awk '{print $1,$2,$3,$4}'
elif [[ $_game = "Roulette" ]];then
	grep --no-filename  "$_time" $base_dir/${_date}_Dealer_schedule | awk '{print $1,$2,$5,$6}'
elif [[ $_game = "Texas_Hold_EM" ]];then
        grep --no-filename  "$_time" $base_dir/${_date}_Dealer_schedule | awk '{print $1,$2,$7,$8}' 
else
 echo "Game is not valid. Valid games are BlackJack,Roulette,Texas_Hold_EM"	
fi	
