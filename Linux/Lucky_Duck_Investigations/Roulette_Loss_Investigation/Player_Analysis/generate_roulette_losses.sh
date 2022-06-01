#!/bin/bash
base_dir="../Player_Analysis"
awk '{if(substr($3,1,1)=="-") print $0}' $base_dir/0310_win_loss_player_data $base_dir/0312_win_loss_player_data $base_dir/0315_win_loss_player_data > Roulette_Losses
