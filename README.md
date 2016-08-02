Description

1. The first step is to download and unzip files in the working directory
2. Next I install data.table package
3. the test and Train files are read into the data tables
4. Then I use cbind to bind the test and Train files and finally rbind function to bind the Train dataset with the test dataset

5. I then grep the mean or std features from the features file and store it in a features_extract dataset

6. I then added descriptive headings to the activity dataset namely - “Activity num” and “Activity Title”

7. Then I label the features names with appropriate names

8. Last step is to write the combined dataset into a Tidy data file.

