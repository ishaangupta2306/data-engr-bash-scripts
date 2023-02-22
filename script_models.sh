#! /bin/bash

<<COMMENTS
Moves the tree-based models (Random Forest, GBM, and XGBoost) to the tree_models/ folder,
Deletes all other models (kNN and Logistic).
(HINT: Use a FOR statement to loop through files in the folder model_out/.
Use a CASE statement to match on the contents of the file 'case ($cat $file)'.
If the text contains a tree-based model name (*"Random Forest"*|*GBM*|*XGBoost*)
then move to tree_models/ otherwise(*KNN*|*Logistic*)*KNN*|*Logistic*) delete the file.
Create a default match that prints out 'Unknown model in FILE where FILE is the filename'.
Then run your script.)
COMMENTS

for file in datasets/model_out/*; do
    # chmod u+r $file
    case "$($cat "$file")" in
        *"Random Forest"*|*GBM*|*XGBoost*)
            mv "$file" output/tree_models/
        ;;
        *KNN*|*Logistic*)
            rm "$file"
        ;;
        *)
            echo "Unknown model in FILE where FILE is the filename"
    esac
done
