# GettingAndCleaningData
Course project for Coursera "Getting and Cleaning Data" 

B. Carver | February 2015  |  Project Code Book - Codebook.md

<b>Data Manipulation and Transformation Steps</b>

| Filename  | Action/Manipulation | 
| ------------- | ------------- |
| Data loads ||
| ColumnNames.txt  | This file was created and loaded as a reference data frame identifying the columns of interest |
| X_test.txt/.csv<br>X_train.tst/.csv  | The base data files *.txt were edited to:<br>- convert any multi-space strings to a single space <br> - remove leading spaces in the first column<br>- use a comma field separator<p>and then were saved as filetype *.csv<br> These CSV files were then loaded to a working data frame and columns of interest selected in a subset action | 
| y_test.txt<br>y_train.txt | These files identify the activity being performed at each observtion in the base data<br> they were loaded to a working data frame and bound to each base data row from the corresponding base data file X_test.txt/.csv & X_train.tst/.csv |   
| subject_test.txt<br>subject_train.txt  | These files identify the subject associated with each base data row and were loaded to separate data frames |
| 
| activity_labels.txt | Text labels describing each observed activity (walking, sitting ...)<br> These were used in a manual R recode action to add labels to the numeric base indicator as teh "Activity_Label" variable.|
| ColumnNames.txt  | Researcher constructed indices to identify and correlate rownames of interest |
| run_analysis.R  | R script containing the automated data manipulation steps | 
| tidy_data.txt  | Averages by Subject for columns of interest (those base columns associated with mean or standard deviation |
| CodeBook.md  | Code book describing how the tidy data set was constructed |

See the README.md document for a list and description of all data sets in use.

<b>Variables in Use</b>

BaseDataColumnNames data frame - used in the interim data assembly and manipulation steps.  

| Variable  | Description | 
| ------------- | ------------- |
| Position  | Relative position of a variable in the base data (  X_test.txt/.csv & X_train.tst/.csv ) <br>selected values 1 to 561 |
| LoadVarName | The "V"-prefixed variable name assigned to base data frames in X_test.csv & X_train.tst.csv |
| TidyName | The final "tidy data set" variable name |
| OriginalName | The original base data measureent name from the features.txt file<br>(These were recoded for R purposes into names that better matched R syntax standards)|

Interim global data frame 


tidy_data.txt data frame

| Variable  | Description | 
| ------------- | ------------- |
| Position  | Relative position of a variable in the base data (  X_test.txt/.csv & X_train.tst/.csv ) <br>selected values 1 to 561 |

