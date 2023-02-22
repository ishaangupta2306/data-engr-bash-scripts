#! /bin/bash
<<COMMENTS
Download all 4 CSV files.
Create a mandatory 1 sec pause between downloading all files.
Limit the download rate to 2500 KB/sec.
Extract and print the features from each dataset.
Do you observe any relationship between the datasets.
COMMENTS


wget --wait=1 --limit-rate=2500k -i datasets/url_list.csv -P download/file/
for file in download/file/*; do
    features=$(head -n 1 $file | tr ',' ' ')
    # Print the features
    echo "Features: $features"
    echo "-------------------------------"
done
# Integrate the ML features across all observations from the model_out dataset
# to a single CSV file

for file in datasets/model_out/*; do
    # Print the file name
    echo "Processing file $file..."
    # Extract the feature column (replace column number with the actual column number)
    cut -d',' -f1,2,3 "$file" | tail -n +2 >> tmp_feature_column.csv
done

# Combine all feature columns into a single file
paste -d',' *.csv > integrated_features.csv

# Remove temporary file
rm -f tmp_feature_column.csv