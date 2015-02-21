# GettingAndCleaningData
Course project for Coursera "Getting and Cleaning Data" 

B. Carver | February 2015  |  Project Code Book - Codebook.md

<b>Data Manipulation and Transformation Steps</b>

| Filename  | Action/Manipulation | 
| ------------- | ------------- |
| ColumnNames.txt  | this file was created and loaded as a reference dataframe identifying the columns of interest 
| X_test.txt/.csv<br>X_train.tst/.csv  | The base data files *.txt were edited to:<br>- convert amm multi-space strings to a single space <br> - remove leading spaces in the first column<br>- use a comma field separator<p>and then were saved as filetype *.csv<br> These were then loaded to a dataframe and columns of interest selected in a subset action| 
| subject_test.txt<br>subject_train.txt  | These files were loaded to sparate data frames and bound to their associated base data rows   |
|   | Observed individual identifying row matching each detailed measurement row in X_train.csv   |
| activity_labels.txt | Text labels describing each observed activity (waliking, sitting ...) |
| ColumnNames.txt  | Researcher constructed indices to identify and correlate rownames of interest |
| run_analysis.R  | R script containing the automated data manipulation steps | 
| tidy_data.txt  | Averages by Subject for columns of interest (those base columns associated with mean or standard deviation |
| CodeBook.md  | Code book describing how the tidy data set was constructed |

See the README.md document for a list and description of all data sets in use.

<b>Variables in Use</b>

BaseDataColumnNames data frame

| Variable  | Description | 
| ------------- | ------------- |
| Position  | Relative position of a variable in the base data (  X_test.txt/.csv & X_train.tst/.csv ) <br>selected values 1 to 561 |
| LoadVarName | The "V"-prefixed variable name assigned to base data frames in X_test.csv & X_train.tst.csv |
| TidyName | The final "tidy data set" variable name |
| OriginalName | The original base data measureent name from the features.txt file<br>(These were recoded for R purposes into names that better matched R syntax standards)|

