A = audioread('./Separate Data 25 cm/A/25_A_1.wav');
B = audioread('./Separate Data 25 cm/A/25_A_2.wav');
C = audioread('./Separate Data 25 cm/A/25_A_3.wav');
D = audioread('./Separate Data 25 cm/A/25_A_4.wav');
E = audioread('./Separate Data 25 cm/A/25_A_5.wav');
F1 = audioread('./Separate Data 25 cm/A/25_A_6.wav');
G = audioread('./Separate Data 25 cm/A/25_A_7.wav');
H = audioread('./Separate Data 25 cm/A/25_A_8.wav');
I = audioread('./Separate Data 25 cm/A/25_A_9.wav');


% A = audioread('./Separate Data 25 cm/B/25_B_1.wav');
% B = audioread('./Separate Data 25 cm/B/25_B_2.wav');
% C = audioread('./Separate Data 25 cm/B/25_B_3.wav');
% D = audioread('./Separate Data 25 cm/B/25_B_4.wav');
% E = audioread('./Separate Data 25 cm/B/25_B_5.wav');
% F1 = audioread('./Separate Data 25 cm/B/25_B_6.wav');
% G = audioread('./Separate Data 25 cm/B/25_B_7.wav');
% H = audioread('./Separate Data 25 cm/B/25_B_8.wav');
% I = audioread('./Separate Data 25 cm/B/25_B_9.wav');
% 
% A = audioread('./Separate Data 25 cm/C/25_C_1.wav');
% B = audioread('./Separate Data 25 cm/C/25_C_2.wav');
% C = audioread('./Separate Data 25 cm/C/25_C_3.wav');
% D = audioread('./Separate Data 25 cm/C/25_C_4.wav');
% E = audioread('./Separate Data 25 cm/C/25_C_5.wav');
% F1 = audioread('./Separate Data 25 cm/C/25_C_6.wav');
% G = audioread('./Separate Data 25 cm/C/25_C_7.wav');
% H = audioread('./Separate Data 25 cm/C/25_C_8.wav');
% I = audioread('./Separate Data 25 cm/C/25_C_9.wav');
% 
% A = audioread('./Separate Data 25 cm/D/25_D_1.wav');
% B = audioread('./Separate Data 25 cm/D/25_D_2.wav');
% C = audioread('./Separate Data 25 cm/D/25_D_3.wav');
% D = audioread('./Separate Data 25 cm/D/25_D_4.wav');
% E = audioread('./Separate Data 25 cm/D/25_D_5.wav');
% F1 = audioread('./Separate Data 25 cm/D/25_D_6.wav');
% G = audioread('./Separate Data 25 cm/D/25_D_7.wav');
% H = audioread('./Separate Data 25 cm/D/25_D_8.wav');
% I = audioread('./Separate Data 25 cm/D/25_D_9.wav');


% A = audioread('./Separate Data 25 cm/E/25_E_1.wav');
% B = audioread('./Separate Data 25 cm/E/25_E_2.wav');
% C = audioread('./Separate Data 25 cm/E/25_E_3.wav');
% D = audioread('./Separate Data 25 cm/E/25_E_4.wav');
% E = audioread('./Separate Data 25 cm/E/25_E_5.wav');
% F1 = audioread('./Separate Data 25 cm/E/25_E_6.wav');
% G = audioread('./Separate Data 25 cm/E/25_E_7.wav');
% H = audioread('./Separate Data 25 cm/E/25_E_8.wav');
% I = audioread('./Separate Data 25 cm/E/25_E_9.wav');



FS = 256000;
%nfft=1024;
%for example: A has 15359872X1 and the nfft is 10000 then the size of
%spectrogram is 5001 X 1535 if overlap is 0 and 5001 X 3070 if the overlap is 50% 
% also the nfft determines number of rows in spectrogram like if nfft is
% 10000 the rows is nfft/2 = 5001 
nfft = 10000; %number of samples used for generating fft
noverlap=nfft/2; %overlap
%noverlap= 0
wnd= hamming(nfft,'periodic');
[Y, F, T, AA] = spectrogram (A, wnd, noverlap, nfft, FS);
[Y, F, T, BB] = spectrogram (B, wnd, noverlap, nfft, FS);
[Y, F, T, CC] = spectrogram (C, wnd, noverlap, nfft, FS);
[Y, F, T, DD] = spectrogram (D, wnd, noverlap, nfft, FS);
[Y, F, T, EE] = spectrogram (E, wnd, noverlap, nfft, FS);
[Y, F, T, FF] = spectrogram (F1, wnd, noverlap, nfft, FS);
[Y, F, T, GG] = spectrogram (G, wnd, noverlap, nfft, FS);
[Y, F, T, HH] = spectrogram (H, wnd, noverlap, nfft, FS);
[Y, F, T, II] = spectrogram (I, wnd, noverlap, nfft, FS);

%[S,F,T] = spectrogram(X,WINDOW,NOVERLAP,F,Fs) computes the two-sided
 %   spectrogram at the frequencies specified in vector F.  F must be
  %  expressed in Hz and have at least two elements
 %[s, f, t] = spectrogram(A,100000, [], 10000, FS); % You can use your own naming convention

  %plot(abs(AA), 'yaxis');
%mesh(T, F, 20*log10(abs(P)));
%plot(F, abs(P));

% BB = spectrogram(B,100000, [], 10000, FS, 'yaxis');
% 
% CC = spectrogram(C,100000, [], 10000, FS, 'yaxis');
% 
% DD = spectrogram(D,100000, [], 10000, FS, 'yaxis');
% 
% EE = spectrogram(E,100000, [], 10000, FS, 'yaxis');
% 
% FF = spectrogram(F,100000, [], 10000, FS, 'yaxis');
% 
% GG = spectrogram(G,100000, [], 10000, FS, 'yaxis');
% 
% HH = spectrogram(H,100000, [], 10000, FS, 'yaxis');
% 
% II = spectrogram(I,100000, [], 10000, FS, 'yaxis');


TotalMatrix = [AA BB CC DD EE FF GG HH II];

MagSpec = abs(TotalMatrix);

%plot(F, abs(TotalMatrix));

for i = 1 : length(AA)
%for i = 1 : 513
    ParametersG(i,:) = mle(MagSpec(i,:),'distribution','gamma');
end

% for i = 1:length(AA)
plot(ParametersG(:,2))% > mean(ParametersG(:,2)));        
% end

% x = 1:length(AA);
% A = ParametersG(:,2);
% [TF,L,U,C] = isoutlier(A, 'mean');
% plot(x,A,x(TF),A(TF),'x',x,L*ones(1,length(AA)),x,U*ones(1,length(AA)),x,C*ones(1,length(AA)))
% legend('Original Data','Outlier','Lower Threshold','Upper Threshold','Center Value')

%y = lowpass(ParametersG(:,2),FS/4,FS);
% 
% for i = 1:length(y)
%     plot(y);        
% end

