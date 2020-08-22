% m = load('ParametersMatrix_25cm.mat');
% csvwrite('ParametersMatrix_25cm.dat', m.ParametersMatrix_25cm);
% 
% n = load('ParameterMatrix_50cm.mat');
% csvwrite('ParameterMatrix_50cm.dat', n.ParameterMatrix_50cm);
% 
% o = load('ParameterMatrix_75cm.mat');
% csvwrite('ParameterMatrix_75cm.dat', o.ParameterMatrix_75cm);
% 
% p = load('ParametersMatrix_100cm.mat');
% % csvwrite('ParameterMatrix_100cm.dat', p.ParametersMatrix_100cm);

q = load('data.mat');
csvwrite('data.dat', q.input);

% r = load('newitemm_allsensors_morebins.mat');
% csvwrite('newitemm_allsensors_morebins.dat', r.input);
