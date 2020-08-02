FS = 256000;
%Spectrogram specifications
nfft = 2*1024 %number of samples used for generating fft
noverlap=nfft/4; %overlap
% noverlap= 0
wnd= hanning(nfft,'periodic');

% the directory where the subfolders are the sensor data like A,B,C,D,E
D = './SeparateData25cm'; %Here I just sued A,C, E sensor data

dir_full_path = dir(fullfile(D,'*'));
N = setdiff({dir_full_path([dir_full_path.isdir]).name},{'.','..'}); % list of subfolders of D.

%entire file count
total_index = 1;
kk = 0;
for Directory_index = 1:numel(N)
    T = dir(fullfile(D,N{Directory_index},'*'));% improve by specifying the file extension.
    C = {T(~[T.isdir]).name}; % files in subfolder.
    for file_index = 1:numel(C)
        % get the full path of the file
        F = fullfile(D,N{Directory_index},C{file_index})
        
%       read_data_elements = 0
        [y,fs] = audioread(F);
        kk = kk+1
        subplot(2,3,kk)
        
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
        
        if(kk == 5)
            start = 10*FS;
        else
            start = 10*FS;
        end
        end_start = length(y) - 40*FS
        y = y(start:end_start);
        spectrogram (y, wnd, noverlap, nfft, FS, 'yaxis');
%         spectrogram (y, [], [], [], FS, 'yaxis');
%        
        title_string = sprintf('Sensor %s', sensor_name);
        title(title_string); 
        colorbar('off');

        break
    end
end
