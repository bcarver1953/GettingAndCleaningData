# GettingAndCleaningData
Course project for Coursera "Getting and Cleaning Data" 

B. Carver | February 2015  |  Project Code Book - Codebook.md

<b>Data Manipulation and Transformation Steps</b>

| Filename  | Action/Manipulation | 
| ------------- | ------------- |
| <b>Data loads</b> ||
| ColumnNames.txt  | A file was created and loaded by this researcher as the source for a reference data frame identifying the columns of interest by position, interim "V"-prefixed variable name, original base data variable name and a final "tidy data" column name - for each of 86 base data variables present in the X_test and Y_train txt/csv files |
| X_test.txt/.csv<br>X_train.tst/.csv  | The base data files *.txt were edited to:<br>- convert any multi-space strings to a single space <br> - remove leading spaces in the first column<br>- use a comma field separator<p>and then were saved as filetype *.csv<br> These CSV files were then loaded to a working data frame and columns of interest selected in a subset action | 
| y_test.txt<br>y_train.txt | These files identify the activity being performed at each observtion in the base data<br> they were loaded to a working data frame and bound to each base data row from the corresponding base data file X_test.txt/.csv & X_train.tst/.csv |   
| subject_test.txt<br>subject_train.txt  | These files identify the subject associated with each base data row and were loaded to separate data frames |
| <b>Column Binding</b> | For each of test and train data:<br> The three compnent files were loaded to working data frames, >br>variables of interest in the base data selected and renamed <br> and then combined in a "cbind" action to associate each subject with the observed activity and the related device measurements |
| <b>Merge</b> | The resulting Test and Train observations were merged in an rbind action into a single global set of observations |
| <b>Recoding</b> | Activity labels were recoded into a new "Activity_Label" variable for greater readbility |
| <b>Summarization</b> | 
| tidy_data.txt  | Averages by Subject for columns of interest (those base columns associated with mean or standard deviation |


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
| Activity_Label | The manually observed activity that described a subject at time of observation/data collection<br>Values:<br>Walking<br>Walking Upstairs<br>Walking Downstairs<br>Sitting<br>Standing<br>Laying |
| Subject  | A unique key to identify each subject (person) observed and monitored in the study |
| averages ||

