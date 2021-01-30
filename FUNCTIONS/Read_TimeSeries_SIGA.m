function Results = Read_TimeSeries_SIGA(NameFile)
%% Time Series Aggregation
% -------------------------------------------------------------------------
% Matlab Version - R2018b 
% -------------------------------------------------------------------------
%                              BASE DATA 
% -------------------------------------------------------------------------
% The Nature Conservancy - TNC
% 
% Project     : Blue Energy 
% 
% Author      : Jonathan Nogales Pimentel
% Email       : jonathan.nogales@tnc.org
% Date        : November, 2020
% 
% -------------------------------------------------------------------------
% This program is free software: you can redistribute it and/or modify it 
% under the terms of the GNU General Public License as published by the 
% Free Software Foundation, either version 3 of the License, or option) any 
% later version. This program is distributed in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty of 
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
% ee the GNU General Public License for more details. You should have 
% received a copy of the GNU General Public License along with this program
% If not, see http://www.gnu.org/licenses/.
% -------------------------------------------------------------------------
%                               DESCRIPTION 
% -------------------------------------------------------------------------
% 
%--------------------------------------------------------------------------
%                               INPUT DATA 
%--------------------------------------------------------------------------
%
% -------------------------------------------------------------------------
%                               OUTPUT DATA
% -------------------------------------------------------------------------
%

%% Read File
% Open File
ID_File = fopen(NameFile,'r');

% Read firt line
LineText = char('Init');

% Counter
i = 1;

while ischar(LineText)
    % Read New Line
    LineText = fgetl(ID_File);    
    % TimeSeries Number
    if i == 2
        Results.Col     = str2double(LineText);
    % Date Number
    elseif i == 5
        Results.Fil     = str2double(LineText); 
    % Read NaN-Value
    elseif i == 8
        Results.NoValue = str2double(LineText);        
    % Coordinates - X
    elseif i == 11
        Tmp             = strsplit(LineText,' ');
        Tmp             = cellfun(@str2double, Tmp);
        Results.X       = Tmp;        
    % Coordinates - Y
    elseif i == 14
        Tmp             = strsplit(LineText,' ');
        Tmp             = cellfun(@str2double, Tmp);
        Results.Y       = Tmp;
    % Coordinates - Z
    elseif i == 17
        Tmp             = strsplit(LineText,' ');
        Tmp             = cellfun(@str2double, Tmp);
        Results.Z       = Tmp;
    elseif i == 20
        Tmp             = strsplit(LineText,' ');
        Results.NameVar = Tmp(4:end)';
        
        Results.Data    = textscan(ID_File,['%f',repmat(' %f',1,Results.Col + 2)]);
        Results.Data    = cell2mat(Results.Data);
        % Date
        Results.Date    = datetime(Results.Data(:,1:3));
        % Data
        Results.Data    = Results.Data(:,4:end);
    end
    
    % Counter
    i = i + 1;
end

% NaN
Results.Data(Results.Data==Results.NoValue) = NaN;

% Close File 
fclose(ID_File);
