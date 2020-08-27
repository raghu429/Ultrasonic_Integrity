#import sklearn
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB, MultinomialNB

import numpy as np
from numpy import genfromtxt
#Import scikit-learn metrics module for accuracy calculation
from sklearn import metrics
from sklearn.ensemble import VotingClassifier



#my_data = my_data[1:4, :]
#print('my_data', my_data)

NumberofClasses = 5

def data_label_stacker(FV_length, my_data):

    ### arrange the dataset into different sensor rows and alpha, beta columns. This is a 
    # very rudimentary way but it does the job

    #prepare the label vector
    ### prepare the label file with the following values  
    # 1 = sensor A, 2 = sensor B, 3 = sensor C, 4 = sensor D, 5 = sensor E 

    print('number of classes', my_data.shape[1]/FV_length)
    print('my data shape', my_data.shape)

    if(NumberofClasses != (my_data.shape[1]/FV_length)):
        print("num classes doesnt match the calculated classes")
    
    x = 1
    label = []
    
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

    print('FV_length', FV_length)
    print('data_final shape', data_final.shape)
    print('labels', label, label.shape)
    
    return (label, data_final)


def fit_classifier(input_file, FtVec_length, rndm_state, train_per):
    #1 = 25CM
    data_in = genfromtxt(input_file, delimiter=',')
    label, data_final = data_label_stacker(FtVec_length, data_in)

    #### split data into train and test set
    X_train, X_test, y_train, y_test = train_test_split(data_final, label, test_size=1-train_per,random_state=rndm_state) # 80% training and 20% test

    ###Create a Gaussian Classifier
    model = GaussianNB()
    
    # gnb = MultinomialNB()
    
    ####Train the model using the training sets
    model.fit(X_train, y_train)

    return(model, X_test, y_test)

def get_weights(echo_distance):
    print('echo distance', echo_distance)
    #classify the weights based on distance
    if(echo_distance <= 25):
        wts = [4,2,1,1]
    elif(echo_distance > 25 and  echo_distance <= 50):
        wts = [2,4,1,1]
    elif(echo_distance > 50 and echo_distance <= 75):
        wts = [1,1,4,2]
    elif(echo_distance > 75 and echo_distance <= 100):
        wts = [1,1,2,4]
    else:
        wts = [2,2,2,2]

    # if(echo_distance <= 35):
    #     wts = [4,1,1]
    # elif(echo_distance > 35 and  echo_distance <= 70):
    #     wts = [1,4,1]
    # elif(echo_distance > 70 and echo_distance <= 100):
    #     wts = [1,1,4]
    # else:
    #     wts = [2,2,2]


    print('selected weights', wts)
    return (wts)

if __name__ == "__main__":
    
    #resolution 001 for pers
    # FtVec_length = 256*9
    
    #resolution 001 for specgram
    # FtVec_length = 1024*9
    
    #dat file given by Eric
    FtVec_length = 161

    #resolution 1 for specgram
    # FtVec_length = 1024*9
    
    #resolution 2 for specgram
    # FtVec_length = 2*9
    
    # def fit_classifier(input_file, FtVec_length, rndm_state, train_per):
    #return model, x_test, y_test

    input_file = './dat_files/25cmdata.dat'
    model_25, x_test_25, y_test_25 = fit_classifier(input_file, FtVec_length, 101, 0.8)    
    
    input_file = './dat_files/50cmdata.dat'
    model_50, x_test_50, y_test_50 = fit_classifier(input_file, FtVec_length, 102, 0.8)    

    input_file = './dat_files/75cmdata.dat'
    model_75, x_test_75, y_test_75 = fit_classifier(input_file, FtVec_length, 103, 0.8)    

    input_file = './dat_files/100cmdata.dat'
    model_100, x_test_100, y_test_100 = fit_classifier(input_file, FtVec_length, 104, 0.8)    
    

    #test the distance file:
    input_file = './dat_files/75cmdata.dat'
    distance = 55
    
    data_in = genfromtxt(input_file, delimiter=',')
    label, data_final = data_label_stacker(FtVec_length, data_in)

    #### split data into train and test set
    X_train, X_test, y_train, y_test = train_test_split(data_final, label, test_size=0.2,random_state=200) # 80% training and 20% test

    #define ensemble mod
    model_ensemble = VotingClassifier(estimators=[('m1', model_25), ('m2', model_50), ('m3', model_75), ('m4', model_100)],voting='soft', weights= get_weights(distance))

    # model_ensemble = VotingClassifier(estimators=[('m1', model_25), ('m2', model_50), ('m3', model_100)],voting='soft', weights= get_weights(distance))

    X_test =  x_test_50
    y_test = y_test_50

    # gnb = MultinomialNB()
    
    ####Train the model using the training sets
    model_ensemble.fit(X_train, y_train)

    #####Predict the response for test dataset
    y_pred = model_ensemble.predict(X_test)

    # Model Accuracy, how often is the classifier correct?
    print("Accuracy:",metrics.accuracy_score(y_test, y_pred))
