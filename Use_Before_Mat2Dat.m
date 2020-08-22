%% INIT 

close all

%% Use TotalMatrix = [AA BB CC DD EE FF GG HH II] to concatenate all
% matricies together. 
% Concatenate all 9 samples 
% 
% Our sampling frequency, Fs, is 256,000 Hz. 
% According to the Nyquist Theorem, Fs >= 2*F, where F is the frequency of
% your signal. Therefore, Fmax = Fs/2
% 
% So, if we have 5001 rows, then each row is a frequency bin of width
% Fs/2/5001 = 25.594 Hz per bin. 
% 
% Example: Row 1243 has a frequency range of 1243*25.594 to 1244*25.594
% 
% In general, Row N has a frequency range of (N*FS)/(2*#rows in your matrix)

A = audioread('50_A_1.wav');
B = audioread('50_A_2.wav');
C = audioread('25_A_3.wav');
D = audioread('50_A_4.wav');
E = audioread('50_A_5.wav');
F = audioread('50_A_6.wav');
G = audioread('50_A_7.wav');
H = audioread('50_A_8.wav');
I = audioread('50_A_9.wav');

FS = 256000;

AA = spectrogram(A,100000, [], 10000, FS, 'yaxis'); % You can use your own naming convention

BB = spectrogram(B,100000, [], 10000, FS, 'yaxis');

CC = spectrogram(C,100000, [], 10000, FS, 'yaxis');

DD = spectrogram(D,100000, [], 10000, FS, 'yaxis');

EE = spectrogram(E,100000, [], 10000, FS, 'yaxis');

FF = spectrogram(F,100000, [], 10000, FS, 'yaxis');

GG = spectrogram(G,100000, [], 10000, FS, 'yaxis');

HH = spectrogram(H,100000, [], 10000, FS, 'yaxis');

II = spectrogram(I,100000, [], 10000, FS, 'yaxis');


TotalMatrixA = [AA BB CC DD EE FF GG HH II];

MagSpecA = abs(TotalMatrixA);

%% Do for each sensor

A = audioread('50_B_1.wav');
B = audioread('50_B_2.wav');
C = audioread('25_B_3.wav');
D = audioread('50_B_4.wav');
E = audioread('50_B_5.wav');
F = audioread('50_B_6.wav');
G = audioread('50_B_7.wav');
H = audioread('50_B_8.wav');
I = audioread('50_B_9.wav');

FS = 256000;

AA = spectrogram(A,100000, [], 10000, FS, 'yaxis'); % You can use your own naming convention

BB = spectrogram(B,100000, [], 10000, FS, 'yaxis');

CC = spectrogram(C,100000, [], 10000, FS, 'yaxis');

DD = spectrogram(D,100000, [], 10000, FS, 'yaxis');

EE = spectrogram(E,100000, [], 10000, FS, 'yaxis');

FF = spectrogram(F,100000, [], 10000, FS, 'yaxis');

GG = spectrogram(G,100000, [], 10000, FS, 'yaxis');

HH = spectrogram(H,100000, [], 10000, FS, 'yaxis');

II = spectrogram(I,100000, [], 10000, FS, 'yaxis');


TotalMatrixB = [AA BB CC DD EE FF GG HH II];

MagSpecB = abs(TotalMatrixA);

%% Do for each sensor

A = audioread('50_C_1.wav');
B = audioread('50_C_2.wav');
C = audioread('25_C_3.wav');
D = audioread('50_C_4.wav');
E = audioread('50_C_5.wav');
F = audioread('50_C_6.wav');
G = audioread('50_C_7.wav');
H = audioread('50_C_8.wav');
I = audioread('50_C_9.wav');

FS = 256000;

AA = spectrogram(A,100000, [], 10000, FS, 'yaxis'); % You can use your own naming convention

BB = spectrogram(B,100000, [], 10000, FS, 'yaxis');

CC = spectrogram(C,100000, [], 10000, FS, 'yaxis');

DD = spectrogram(D,100000, [], 10000, FS, 'yaxis');

EE = spectrogram(E,100000, [], 10000, FS, 'yaxis');

FF = spectrogram(F,100000, [], 10000, FS, 'yaxis');

GG = spectrogram(G,100000, [], 10000, FS, 'yaxis');

HH = spectrogram(H,100000, [], 10000, FS, 'yaxis');

II = spectrogram(I,100000, [], 10000, FS, 'yaxis');


TotalMatrixC = [AA BB CC DD EE FF GG HH II];

MagSpecC = abs(TotalMatrixA);

%% Do for each sensor

A = audioread('50_D_1.wav');
B = audioread('50_D_2.wav');
C = audioread('25_D_3.wav');
D = audioread('50_D_4.wav');
E = audioread('50_D_5.wav');
F = audioread('50_D_6.wav');
G = audioread('50_D_7.wav');
H = audioread('50_D_8.wav');
I = audioread('50_D_9.wav');

FS = 256000;

AA = spectrogram(A,100000, [], 10000, FS, 'yaxis'); % You can use your own naming convention

BB = spectrogram(B,100000, [], 10000, FS, 'yaxis');

CC = spectrogram(C,100000, [], 10000, FS, 'yaxis');

DD = spectrogram(D,100000, [], 10000, FS, 'yaxis');

EE = spectrogram(E,100000, [], 10000, FS, 'yaxis');

FF = spectrogram(F,100000, [], 10000, FS, 'yaxis');

GG = spectrogram(G,100000, [], 10000, FS, 'yaxis');

HH = spectrogram(H,100000, [], 10000, FS, 'yaxis');

II = spectrogram(I,100000, [], 10000, FS, 'yaxis');


TotalMatrixD = [AA BB CC DD EE FF GG HH II];

MagSpecD = abs(TotalMatrixA);

%% Do for each sensor

A = audioread('50_E_1.wav');
B = audioread('50_E_2.wav');
C = audioread('25_E_3.wav');
D = audioread('50_E_4.wav');
E = audioread('50_E_5.wav');
F = audioread('50_E_6.wav');
G = audioread('50_E_7.wav');
H = audioread('50_E_8.wav');
I = audioread('50_E_9.wav');

FS = 256000;

AA = spectrogram(A,100000, [], 10000, FS, 'yaxis'); % You can use your own naming convention

BB = spectrogram(B,100000, [], 10000, FS, 'yaxis');

CC = spectrogram(C,100000, [], 10000, FS, 'yaxis');

DD = spectrogram(D,100000, [], 10000, FS, 'yaxis');

EE = spectrogram(E,100000, [], 10000, FS, 'yaxis');

FF = spectrogram(F,100000, [], 10000, FS, 'yaxis');

GG = spectrogram(G,100000, [], 10000, FS, 'yaxis');

HH = spectrogram(H,100000, [], 10000, FS, 'yaxis');

II = spectrogram(I,100000, [], 10000, FS, 'yaxis');


TotalMatrixE = [AA BB CC DD EE FF GG HH II];

MagSpecE = abs(TotalMatrixA);

%% Let's begin by doing a search along our Magspec matrix and find the
%  rows/frequency bins which have the higehst energy content. 
%  We wish to find the row which has the highest value in our matrix. 
%  We know how to find the maximum value, and the column in which it is located.  


Nrows = size(MagSpecA);
Nrows = Nrows(1)-1;

M = max(MagSpecA(2:Nrows),[],2);
MM = max(M);
k = find(MagSpecA == MM);

ROI = mod(k, Nrows);

LowerBound = ROI - 40;

UpperBound = ROI + 40;

% You can do this for each sensor, but I chose to just do it for one sensor
% and then use this width for each sensor. Has its pros and cons. 

% M = max(MagSpecAA,[],2);
% MM = max(M);
% k = find(MagSpecAA == MM);
% 
% ROI = mod(k,Nrows)


A = transpose(MagSpecA(LowerBound:UpperBound,:));  
B = transpose(MagSpecB(LowerBound:UpperBound,:));
C = transpose(MagSpecC(LowerBound:UpperBound,:));
D = transpose(MagSpecD(LowerBound:UpperBound,:));
E = transpose(MagSpecE(LowerBound:UpperBound,:));


input = [A B C D E];



%Let's convert this to a .dat file and input it to our python script 




