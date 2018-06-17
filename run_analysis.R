# download and extract original data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip", method="curl")

unzip("data/Dataset.zip", exdir = "data")

# load data as variable
train.X   <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train.Y   <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
train.sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
test.X    <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test.Y    <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test.sub  <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
labels  <- read.table("./data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# step1: Merges the training and the test sets to create one data set
train <- bind_cols(train.X, train.Y, train.sub)
test  <- bind_cols(test.X, test.Y, test.sub)
dataset <- bind_rows(train, test)

names(dataset) <- labels$V2
names(dataset)[562:563] <- c("activityIdx", "subject")
names(activity_labels) <- c("activityIdx", "activity")

# step2: Extracts only the measurements on the mean and standard deviation for each measurement
meanstd <- dataset[, grep("mean\\(\\)|std\\(\\)|^activityIdx$|^subject$", names(dataset))]

# step3: Uses descriptive activity names to name the activities in the data set
mergedData <- merge(meanstd, activity_labels)
tidy <- select(mergedData, -activityIdx)

# step4: Appropriately labels the data set with descriptive variable names
# step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
result <- aggregate(tidy[,1:66], list(tidy$activity, tidy$subject), FUN = mean)
names(result)[1] <- "activity"
names(result)[2] <- "subject"

write.table(result, "tidy.txt", row.names = FALSE)
