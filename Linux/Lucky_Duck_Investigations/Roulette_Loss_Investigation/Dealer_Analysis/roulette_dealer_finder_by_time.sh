#!/bin/bash
base_dir="../Dealer_Analysis"
_date=$1
_time=$2" "$3
if [[   -z  $1  ]] || [[   -z  $2  ]];then
       	echo "Please run the script with <date> <time>. Ex: ./roulette_dealer_finder_by_time 0310 10:00:00 AM"
	exit
fi
grep --no-filename  "$_time" $base_dir/${_date}_Dealer_schedule | awk '{print $1,$2,$5,$6}'
