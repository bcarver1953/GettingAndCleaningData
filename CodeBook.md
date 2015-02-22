# Codebook.md - GettingAndCleaningData

B. Carver | February 2015  |  Project Code Book 

<b>Data Manipulation and Transformation Steps</b>

| Filename  | Action/Manipulation | 
| ------------- | ------------- |
| <b>Data loads:</b> | The raw data files needed for this analysis were loaded into working R data frames as shown below.|
| ColumnNames.txt  | A file was created and loaded by this researcher as the source for a reference data frame identifying the columns of interest by position, interim "V"-prefixed variable name, original base data variable name and a final "tidy data" column name - for each of 86 base data variables present in the X_test and Y_train txt/csv files. <br>Data frame: dfCols|
| X_test.txt/.csv<br>X_train.tst/.csv  | The base data files *.txt were manually edited in a text editor to:<br>- convert any multi-space strings to a single space <br> - remove leading spaces in the first column<br>- use a comma field separator<p>and then were saved as filetype *.csv<br> These CSV files were then loaded to a working data frame and columns of interest selected in a subset action.  Column names were updated to the new names from ColumnNames.txt/dfCols. <br>Data frames: dfbtst, dfbtrn| 
| y_test.txt<br>y_train.txt | These files identify the activity being performed at each observtion in the base data.<br> They were loaded to a working data frame and bound to each base data row from the corresponding base data file X_test.txt/.csv & X_train.tst/.csv and manually assigned the column name "Activity". <br>Data frames: dfatst, dfatrn|   
| subject_test.txt<br>subject_train.txt  | These files identify the subject associated with each base data row and were loaded to separate data frames.  The column was manually named "Subject". <br>Data frames: dfstst, dfstrn |
| <b>Column Binding</b> | For each of test and train data:<br> The three component files were loaded to working data frames, variables of interest in the base data were selected and renamed and then combined in a "cbind" action to associate each subject with the observed activity and the related device measurements. <br>Data frames: df_test, df_train|
| <b>Merge</b> | The resulting combined observations in each of the test and train data frame groups were unioned in an rbind action into a single global set of observations ("Interim global data frame" below). <br>Data frame: df_all|
| <b>Recoding</b> | The Activity value in this final combined data frame was recoded into a new "Activity_Label" variable for greater readbility. <br>Data frame: df_all|
| <b>Summarization</b> | Averages by Subject for columns of interest (those base columns associated with mean or standard deviation).   <br>Data frame: df_summary <br>These summary results were saved to tidy_data.txt.|


See the README.md document for a list and description of all data sets in use.

<b>Variables in Use</b>

BaseDataColumnNames data frame - used in the interim data assembly and manipulation steps.
<br>One row per measure column name related to mean or standard deviation. 

| Variable  | Description | 
| ------------- | ------------- |
| Position  | Relative position of a variable in the base data (  X_test.txt/.csv & X_train.tst/.csv ) <br>selected values 1 to 561 |
| LoadVarName | The "V"-prefixed variable name assigned to base data frames in X_test.csv & X_train.tst.csv |
| TidyName | The final "tidy data set" variable name |
| OriginalName | The original base data measureent name from the features.txt file<br>(These were recoded for R purposes into names that better matched R syntax standards)|

<b>Interim global data frame</b>
<br>One row per observation in either the test or train data sets.

| Variable  | Description | 
| ------------- | ------------- |
| Subject  | A unique key to identify each subject (person) observed and monitored in the study <br>Values:<br>numeric 1 through 30 |
| Activity | Original numeric activity code from y_test and y_train.txt<br>The manually observed activity that described a subject at time of observation/data collection<br>Values:<br>Values:<br>1 Walking<br>2 Walking Upstairs<br>3 Walking Downstairs<br>4 Sitting<br>5 Standing<br>6 Laying |
| Activity_Label | Character descriptino of Activity.<br>Values:<br>Walking<br>Walking Upstairs<br>Walking Downstairs<br>Sitting<br>Standing<br>Laying |
| Count | The value "1" for each observation (as a Qualty Assurance measure)|
| *Measures* | 86 separate mean and standard deviation measurements from the base data |


tidy_data.txt data frame
<br>One row per activity and subject with the mean of 86 "mean" or "stanrdard deviation" measurements 

| Variable  | Description | 
| ------------- | ------------- |
| Activity_Label | The manually observed activity that described a subject at time of observation/data collection<br>Values:<br>Walking<br>Walking Upstairs<br>Walking Downstairs<br>Sitting<br>Standing<br>Laying |
| Subject  | A unique key to identify each subject (person) observed and monitored in the study <br>Values:<br>integer 1 through 30 |
| averages |86 separate numeric mean and standard deviation measurements summarized from the base data to each Activity_Label and Subject.|

Measurement Variables:
| ------------- | ------------- | ------------- | ------------- | ------------- |
| BodyAcc_mean_X  | BodyAcc_mean_Y  | BodyAcc_mean_Z  | BodyAcc_std_X  | BodyAcc_std_Y  |
| BodyAcc_std_Z  | GravityAcc_mean_X  | GravityAcc_mean_Y  | GravityAcc_mean_Z  | GravityAcc_std_X  |
| GravityAcc_std_Y  | GravityAcc_std_Z  | BodyAccJerk_mean_X  | BodyAccJerk_mean_Y  | BodyAccJerk_mean_Z |
| BodyAccJerk_std_X  | BodyAccJerk_std_Y  | BodyAccJerk_std_Z  | BodyGyro_mean_X  | BodyGyro_mean_Y |
| BodyGyro_mean_Z  | BodyGyro_std_X  | BodyGyro_std_Y  | BodyGyro_std_Z  | BodyGyroJerk_mean_X |
| BodyGyroJerk_mean_Y  | BodyGyroJerk_mean_Z  | BodyGyroJerk_std_X  | BodyGyroJerk_std_Y  | BodyGyroJerk_std_Z |
| BodyAccMag_mean  | BodyAccMag_std  | GravityAccMag_mean  | GravityAccMag_std  | BodyAccJerkMag_mean |
| BodyAccJerkMag_std  | BodyGyroMag_mean  | BodyGyroMag_std  | BodyGyroJerkMag_mean  | BodyGyroJerkMag_std |
| fBodyAcc_mean_X  | fBodyAcc_mean_Y  | fBodyAcc_mean_Z  | fBodyAcc_std_X  | fBodyAcc_std_Y  |
| fBodyAcc_std_Z  | fBodyAcc_meanFreq_X  | fBodyAcc_meanFreq_Y  | fBodyAcc_meanFreq_Z  | fBodyAccJerk_mean_X |
| fBodyAccJerk_mean_Y  | fBodyAccJerk_mean_Z  | fBodyAccJerk_std_X  | fBodyAccJerk_std_Y  | fBodyAccJerk_std_Z  |
| fBodyAccJerk_meanFreq_X  | fBodyAccJerk_meanFreq_Y  | fBodyAccJerk_meanFreq_Z  | fBodyGyro_mean_X  | fBodyGyro_mean_Y  |
| fBodyGyro_mean_Z  | fBodyGyro_std_X  | fBodyGyro_std_Y  | fBodyGyro_std_Z  | fBodyGyro_meanFreq_X  |
| fBodyGyro_meanFreq_Y  | fBodyGyro_meanFreq_Z  | fBodyAccMag_mean  | fBodyAccMag_std  | fBodyAccMag_meanFreq |
| fBodyBodyAccJerkMag_mean  | fBodyBodyAccJerkMag_std  | fBodyBodyAccJerkMag_meanFreq  | fBodyBodyGyroMag_mean  | fBodyBodyGyroMag_std  |
| fBodyBodyGyroMag_meanFreq  | fBodyBodyGyroJerkMag_mean  | fBodyBodyGyroJerkMag_std  | fBodyBodyGyroJerkMag_meanFreq  | angletBodyAccMean_gravity |
| angletBodyAccJerkMean_gravityMean  | angletBodyGyroMean_gravityMean  | angletBodyGyroJerkMean_gravityMean | angleX_gravityMean  | angleY_gravityMean |
| angleZ_gravityMean | 
