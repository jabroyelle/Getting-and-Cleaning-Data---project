## CodeBook for the course project

### input Data

The input data "Human Activity Recognition Using Smartphones Dataset" are preprocessed acceloremter's & Gyroscopic's measurements  records from experiments for 30 volunters wearing Galaxy S II during typical physical activities (Walking, Sitting ...). 
 
the experiments data are separated in 2 groups (directores): 
* one group (called 'training') for 20 people 
*and and other (called 'test') for 10 people 

In the root diretory of the dataset there are 3 important data description files : 
features_info.txt
features.txt
activity_labels.txt

in each group group you have the following files :
* subject_test.txt : volunter's id (number from 1 to 30) - one line per measurement
* y_test.txt : label of the pyisscal activity of the volunter during the measure - one line per measurement
* X_test.txt : a 5610 columns table - each row is a measurement. The columns are related to time and frequency domain variables. The columns/measumements  mapping is described in the 'feature.txt' file and the measurement are described in the features_info.txt file . 
* Inertial Signals/* : the data themselve


## Transformations
# cat /tmp/oo | tr ' ' '\n' | grep -E "mean|std" | sed "s/.*/&=allData$&,/"| sed "s/\.\.\././" | sed "s/\.*=/=/"


### output Tidy 
Two tidy data files are produced :
* Data1 : the measurements on the mean and standard deviation for each measurement 
* Data2 : the average of each variable for each activity and each subject --> Not enough time to finish
