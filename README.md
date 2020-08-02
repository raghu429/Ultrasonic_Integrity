# ultrasonic_integrity

Scource code:
 
1. framesplitter.m  - generates the usonic_data.mat file from each sensor wav file for a particular distance like SeparateData25cm folder.. for all the files in that folder it reads the wav files and generates a mat file
2. waveletscatter_example.m: generates the waveletscatter coefficients and also does the SVM classification
3. supporting files:createSequenceLabels, helperMajority, helperPlot, helperRand

Directories: 
Results:all the mat files are copied there and also has the figures that are generated out of the mat files.
All the SeparateDataXXcm contain the source wav files
