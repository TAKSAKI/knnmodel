% Preprocessing
clear all

% loading data-file 
load('./usps_resampled/usps.mat'); 
[d,ndata]=size(trai);

% データの正規化
for ii = 1 : ndata 
    trai(:,ii)=trai(:,ii)./norm(trai(:,ii)); % normalization 
end
tic
for ii = 1 : ndata 
    test(:,ii)=test(:,ii)./norm(test(:,ii)); % normalization 
end
T1 = toc;
