#
# Getting & Cleaning Data   JHU   February 2015
#
# Course Project
#
# run_analysis.R
#
setwd ("C:\\bnc\\Coursera\\Getting and Cleaning Data\\Course Project\\Submission")
getwd()

library(data.table)
library(dplyr)

##  Note:  Base Data measurements file rows were were pre-processed to:
#      - remove leading spaces, collapse all multiple spaces to a single space
#      - convert space field separators to "," (comma)
#       Pre-processing was performed with a text editor (jEdit)
#

#  Load a dataframe of column index, "V" name, old and new name from a file, 
#   extract TidyName (new column names) and varstokeep 
#    as vectors for later use in renaming 
BaseDataColumnNames     <- "./ColumnNames.txt"
dfCols                  <- read.csv(BaseDataColumnNames, sep = "\t", header = TRUE)
columnNames             <- as.vector(dfCols$TidyName)

#  Load the Vx variable Names that we want to keep 
#  (previously identified manually from the original base data names in Features.txt
#   as any measuremens containing "mean" or "std" i their name)
varstokeep <- as.vector(dfCols$LoadVarName)



##################################################################
##  Test data
# Read the disparate input files into individual dataframes

# Load subject ID's by row to a Data Frame
tstSubjectFile  <- "./subject_test.txt"
dfstst <- read.fwf(tstSubjectFile, widths = c(2),col.names = c("Subject"))

# Load observed activity correlation by row
tstActivityFile <- "./y_test.txt"
dfatst <- read.fwf(tstActivityFile, widths = c(2),col.names = c("Activity"))

# Load Base measurements 
# (Just use default Vn names here, renaming later (the features.txt names are weird in R terms))
tstBaseData     <- "./X_test.csv"
dfbtst <- read.csv(tstBaseData, sep=",", nrows = 3000, header = FALSE, strip.white = TRUE)

# Now select on the V names to get the vars of interest 
#  (Previously identified as having "median" amd "std" in their names)
dfbtst_subset <- dfbtst[varstokeep]

# Rename columns to Tidy Names
setnames(dfbtst_subset, names(dfbtst_subset), columnNames)

## cbind the three components, Subject, Actiity & base data together
df_test <- cbind(dfstst,dfatst,dfbtst_subset) 



##################################################################
##  Train data
# Read the disparate input files into individual dataframes

# Load subject ID's by row to a Data Frame
trnSubjectFile  <- "./subject_train.txt"
dfstrn <- read.fwf(trnSubjectFile, widths = c(2),col.names = c("Subject"))

# Load observed activity correlation by row
trnActivityFile <- "./y_train.txt"
dfatrn <- read.fwf(trnActivityFile, widths = c(2),col.names = c("Activity"))

# Load Base measurements 
# (Just use default Vn names here, renaming later (the features.txt names are weird in R terms))
trnBaseData     <- "./X_train.csv"
dfbtrn <- read.csv(trnBaseData, sep=",", nrows = 7352, header = FALSE, strip.white = TRUE)

# Now select on the V names to get the vars of interest 
#  (Previously identified as having "median" amd "std" in their names)
dfbtrn_subset <- dfbtrn[varstokeep]

# Rename columns to Tidy Names
setnames(dfbtrn_subset, names(dfbtrn_subset), columnNames)

## cbind the three components, Subject, Actiity & base data together
df_train <- cbind(dfstrn,dfatrn,dfbtrn_subset) 


#####################################
## rbind all together

df_all <- rbind(df_test, df_train)

## Recode Activity into a labeled column

df_all$Activity_Label      <- 'Unknown'
df_all$Activity_Label[df_all$Activity == 1 ]       <- "Walking"
df_all$Activity_Label[df_all$Activity == 2 ]       <- "Walking Upstairs"
df_all$Activity_Label[df_all$Activity == 3 ]       <- "Walking Downstairs"
df_all$Activity_Label[df_all$Activity == 4 ]       <- "Sitting"
df_all$Activity_Label[df_all$Activity == 5 ]       <- "Standing"
df_all$Activity_Label[df_all$Activity == 6 ]       <- "Laying"

## Establish a count by observation for QA
df_all$Count <- 1

#  Quality Assurance steps

table(df_all$Subject)
table(df_all$Subject,df_all$Activity_Label)



#########################################
## Save or load  these interim results  
save("df_all", file="./df_all.rda")
# load("./df_all.rda")
#########################################

################################################################# 
## Create a Tidy data set of averages


df_summary <- df_all %>% group_by(Activity_Label, Subject) %>% summarise_each(funs(mean))

write.table(df_summary, file="./tidy_data.txt", row.name=FALSE)
