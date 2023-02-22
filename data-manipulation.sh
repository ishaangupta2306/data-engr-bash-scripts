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
# A bash function 'get_number_wins' that will take a city name and return the number of wins across all years recorded.
get_number_wins(){
    city=$1
    echo $city
    grep $city datasets/soccer_scores.csv | wc -l
}

get_number_wins 'Etar'

# Extract the records using the year or city as a filter provided as an argument to the script.
# Write a bash function 'sum_counts' to return the number of winning goals for the specified filter.
# (HINT: Perform summing an array of values using FOR loop)
sum_counts(){
    filter=$1
    array=($(grep $filter datasets/soccer_scores.csv |cut -d',' -f 3))
    # printf "%s\n" "${array[@]}"
    echo "----------------"
    # Initialize sum variable
    sum=0
    # Loop over array and add up each value
    for i in "${array[@]}"; do
        if [[ "$i" =~ ^[[:space:]]*[0-9]+[[:space:]]*$ ]]; then
            echo ${i// /}
            sum=$((sum + ${i// /}))
            echo "ssssssssssssssssssss $sum"
            # else
            #     echo ";;;;;;;;;;;;;;;;$i"
        fi
        
    done
    echo "----------------"
    
    echo "$sum"
}

sum_counts Arda