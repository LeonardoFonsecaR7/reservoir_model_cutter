%% ================== Import data from text file ==========================


function Cellarray = INC2CELL (file)

%directory = 'C:\Users\leona\Documents\MATLAB\Corte Unisim_II\Unisim-II_11\';

% Initialize variables.
filename = file;
delimiter = ' ';

% Format string for each line of text:

formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

% Open the text file.
fileID = fopen(filename,'r');

% Read columns of data according to format string.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN, 'ReturnOnError', false);

% Close the text file.
fclose(fileID);

% Create output variable
Cellarray = [dataArray{1:end-1}];
% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;