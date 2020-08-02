FS = 256000;
%Spectrogram specifications
% nfft = 2*1024 %number of samples used for generating fft
% noverlap=nfft/4; %overlap
% noverlap= 0
% wnd= hanning(nfft,'periodic');

% the directory where the subfolders are the sensor data like A,B,C,D,E
D = './SeparateData25cm';

dir_full_path = dir(fullfile(D,'*'));
N = setdiff({dir_full_path([dir_full_path.isdir]).name},{'.','..'}); % list of subfolders of D.

%entire file count
total_index = 1;
kk = 0;
% figure
for Directory_index = 1:numel(N)
    T = dir(fullfile(D,N{Directory_index},'*'));% improve by specifying the file extension.
    C = {T(~[T.isdir]).name}; % files in subfolder.
    for file_index = 1:numel(C)
        % get the full path of the file
        F = fullfile(D,N{Directory_index},C{file_index})

        [y,fs] = audioread(F);
        
        start = 25*FS;
        end_start = length(y) - 32*FS
        y = y(start:end_start);
        signal_length = 8000
        sig = y(1:signal_length);
        fb = cwtfilterbank('SignalLength',signal_length,...
        'SamplingFrequency',FS,...
        'VoicesPerOctave', 4);
        [cfs,frq] = wt(fb,sig);
        t = (0:signal_length-1)/FS;figure;pcolor(t,frq,abs(cfs))
        
        kk = kk+1
        if(kk == 1)
            sensor_name = 'A';
        elseif(kk == 2)
            sensor_name = 'B';
        elseif(kk == 3)
            sensor_name = 'C';
        elseif(kk == 4)
            sensor_name = 'D';
        elseif(kk == 5)
            sensor_name = 'E';
        else
            sensor_name = 'None';
        end
            
%         subplot(2,3,kk);
%         cwt(y,'FilterBank',fb)
        set(gca,'yscale','log');
        shading interp;
        axis tight;
        title_string = sprintf('Sensor %s', sensor_name);
        title(title_string);
%         xlabel('Time (s)');
%         ylabel('Frequency (Hz)')
  
        colorbar('off');
	break
    end
%     break
end

if true
figure;
subplot(2,3,1),imshow('./scalo_sensA.png');
subplot(2,3,2),imshow('./scalo_sensB.png');
subplot(2,3,3),imshow('./scalo_sensC.png');
subplot(2,3,4),imshow('./scalo_sensD.png');
subplot(2,3,5),imshow('./scalo_sensE.png');
% xlabel('Time (s)');
% ylabel('Frequency (Hz)')

end
