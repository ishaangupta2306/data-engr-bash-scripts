#! /bin/bash
#  Find the winner in 1959
grep '1959' datasets/soccer_scores.csv | cut -d',' -f 2
# Winners who scored 5 goals. Write them to a file
grep ',5' datasets/soccer_scores.csv | cut -d',' -f 2 > output/scored_5_goals.txt
# Number of records that have either "Arda" or "Dunav" teams
grep 'Arda\|Dunav' datasets/soccer_scores.csv | wc -l
# Find how many times each team has won.
tail -n +2 datasets/soccer_scores.csv | cut -d',' -f 2 | sort | uniq -c
# Change the team "Cherno" to "Cherno City", and "Arda" to "Arda United"
sed -e 's/Cherno/Cherno City/g' \
-e 's/Arda/Arda United/g' \
datasets/soccer_scores.csv > output/soccer_scored_edited.csv