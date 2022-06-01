#!/bin/bash
base_dir="../Dealer_Analysis"
while read time;do
grep --no-filename  "$time" $base_dir/0310_Dealer_schedule | awk '{print $1,$2,$5,$6}' >> Dealers_working_during_losses


done < $base_dir/Time_Loss_Occur.txt
