#  README.md - GettingAndCleaningData

B. Carver | February 2015  |  Project Readme file

Files in use:

| Filename  | Description | 
| ------------- | ------------- |
| X_test.txt/.csv  | Base 'test' data in text and cleaned comma separate values formats  | 
| X_train.tst/.csv | Base 'train' data in text and cleaned comma separate values formats  |
| y_test.txt  | Manual activity observations matching each detailed measurement row in X_test.csv |
| y_train.txt  | Manual activity observations matching each detailed measurement row in X_train.csv |
| subject_test.txt  | Observed individual identifying row matching each detailed measurement row in X_test.csv   |
| subject_train.txt  | Observed individual identifying row matching each detailed measurement row in X_train.csv   |
| activity_labels.txt | Text labels describing each observed activity (walking, sitting ...) |
| ColumnNames.txt  | Researcher constructed indices to identify and correlate rownames of interest |
| features.txt | The original list of measurements present in X_test and X_train.txt/csv |
| dfall.rda | Interim global data frame prior to summarization, in R saved file format |
| run_analysis.R  | R script containing the automated data manipulation steps | 
| tidy_data.txt  | Averages by Subject for columns of interest (those base columns associated with mean or standard deviation |
| CodeBook.md  | Code book describing how the tidy data set was constructed |

See the CodeBook.md document for further details on data manipulation and a detailed description of the final data set TidyData.txt.
