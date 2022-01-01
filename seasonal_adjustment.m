% ------------ The Script Below Seasonally Adjusts the Data Using ARIMA-------------------
% This program utilizes IRIS macroeconomic toolbox packages, so its prior installation is necessary
% Add IRIS path and type 'irisstartup' to get started

close all;
clear all;
 
%% Load data
% Command 'dbdload' loads the data from the 'csv' file 
d = dbload('example.csv');
 
%% Seasonal adjustment. 
list = dbnames(d);
 
for i = 1:length(list)
    if length(list{i})>1
        if strcmp('_s', list{i}(end-1:end))
            d.(list{i}(1:end-2)) = x12(d.(list{i}), Inf, 'mode', 'm');
            d = rmfield(d, list{i});
        end
    end
end
% A file named 's_adj_data.csv' is created 
dbsave(d,'s_adj_dt.csv');

