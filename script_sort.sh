#! /bin/bash

<<COMMENTS
Takes an ARGV argument (a filename), extracts the accuracy score
and conditionally sorts the model result file into one of two folders
(good_models/ or bad_models/).
(HINT: Use grep and cut to extract accuracy value from the files.
Use mathematical flags (-ge, -lt) for conditional sort.
Run your script_sort.sh for each text file as argument.)
COMMENTS

echo "Enter filename"
read -p " Filename: " name
result=$(grep "Accuracy" $name | cut -d':' -f 2)
echo $result
if [[ $result -ge 90 ]]; then
    echo "Good model"
    cp $name datasets/good_models/
else
    echo "Bad model"
    cp $name datasets/bad_models/
fi


