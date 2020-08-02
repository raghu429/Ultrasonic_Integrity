%number of parts you want out of each wave files
%config parameters
number_slices = 59;
slice_start = 25;
slice_end = number_slices - 29;
% the directory where the subfolders are the sensor data like A,B,C,D,E
% D = './SeparateData25cm'; %Here I just sued A,B,C, D, E sensor data
% D = './SeparateData50cm';
% D = './SeparateData75cm';
% D = './SeparateData100cm';
D = './SeparateDataAllcm';


dir_full_path = dir(fullfile(D,'*'));
N = setdiff({dir_full_path([dir_full_path.isdir]).name},{'.','..'}); % list of subfolders of D.

%entire file count
total_index = 1;
for Directory_index = 1:numel(N)
    T = dir(fullfile(D,N{Directory_index},'*'));% improve by specifying the file extension.
    C = {T(~[T.isdir]).name}; % files in subfolder.
    for file_index = 1:numel(C)
        % get the full path of the file
        F = fullfile(D,N{Directory_index},C{file_index})   
        
        % File read and data population
        %Here F is going to be a string like './SeparateData25cm/E/25_E_5.wav'
        [y,fs] = audioread(F);
        frame_samples = fix(length(y)/number_slices);
        
        %frame_samples
        frame_index = slice_start*frame_samples+1;
        
        for k = (slice_start+1):slice_end
            % read necessary indices of the frame
            [y, fs] = audioread(F, [frame_index, frame_samples*k]);  
            frame_index = frame_samples*k + 1;
            % populate the data strcuture
            Data(total_index,:) = y;
            Label{total_index,:}= N{Directory_index};
            total_index = total_index + 1;
        end    
    end
end

%populate the final data strcuture
usonic.Data = Data;
usonic.Labels = Label;
%create the mat file
save('usonic_data.mat','-struct','usonic', '-v7.3');