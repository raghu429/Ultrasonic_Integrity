#import sklearn
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
import numpy as np
from numpy import genfromtxt
#Import scikit-learn metrics module for accuracy calculation
from sklearn import metrics



#my_data = my_data[1:4, :]
#print('my_data', my_data)


def data_label_stacker(FV_length, my_data):

    ### arrange the dataset into different sensor rows and alpha, beta columns. This is a 
    # very rudimentary way but it does the job

    #prepare the label vector
    ### prepare the label file with the following values  
    # 1 = sensor A, 2 = sensor B, 3 = sensor C, 4 = sensor D, 5 = sensor E 

    x = 1
    label = []
    print(my_data.shape[1]/FV_length)
    for i in range( int(my_data.shape[1]/FV_length) ):
        label = np.append(label,[x for j in range(my_data.shape[0])])
        x += 1

    #data stacker
    my_data1 = my_data[:, :FV_length]
    my_data2 = my_data[:, FV_length:2*FV_length]
    my_data3 = my_data[:, 2*FV_length:3*FV_length]
    my_data4 = my_data[:, 3*FV_length:4*FV_length]
    my_data5 = my_data[:, 4*FV_length:5*FV_length]


    my_data_final = np.vstack((my_data1,my_data2))
    my_data_final = np.vstack((my_data_final,my_data3))
    my_data_final = np.vstack((my_data_final,my_data4))
    data_final = np.vstack((my_data_final,my_data5))

    print('data_final', data_final.shape)
    print('labels', label, label.shape)
    
    return (label, data_final)

if __name__ == "__main__":
    
    FtVec_length = 161

    #1 = 25CM
    data_in_1 = genfromtxt('./dat_files/25cmdata.dat', delimiter=',')
    label_1, data_final_1 = data_label_stacker(FtVec_length, data_in_1)

    #### split data into train and test set
    X_train_1, X_test_1, y_train_1, y_test_1 = train_test_split(data_final_1, label_1, test_size=0.2,random_state=222) # 80% training and 20% test

    # print('X_train', X_train)
    # print('y_train', y_train)
    # print('x_test', X_test)
    # print('y_test', y_test)

    #2 = 50 CM
    data_in_2 = genfromtxt('./dat_files/100cmdata.dat', delimiter=',')
    label_2, data_final_2 = data_label_stacker(FtVec_length, data_in_2)

    #### split data into train and test set
    X_train_2, X_test_2, y_train_2, y_test_2 = train_test_split(data_final_2, label_2, test_size=0.2,random_state=222) # 80% training and 20% test

    
    X_train = X_train_1
    y_train = y_train_1
    X_test = X_test_2
    y_test = y_test_2

    ###Create a Gaussian Classifier
    gnb = GaussianNB()

    ####Train the model using the training sets
    gnb.fit(X_train, y_train)

    #####Predict the response for test dataset
    y_pred = gnb.predict(X_test)

    # Model Accuracy, how often is the classifier correct?
    print("Accuracy:",metrics.accuracy_score(y_test, y_pred))
