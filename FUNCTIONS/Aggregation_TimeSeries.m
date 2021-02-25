function ResultsAgg = Aggregation_TimeSeries(Results, Resolution, NameFun)
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

%% Functions
if strcmp(NameFun,'Promedio')
    MyFun = @(x) mean(x,'omitnan');
elseif strcmp(NameFun,'Suma')
    MyFun = @(x) sum(x,'omitnan');
elseif strcmp(NameFun,'Mínimo')
    MyFun = @(x) min(x);
elseif strcmp(NameFun,'Máximo')
    MyFun = @(x) max(x);
end

%%
if strcmp(Resolution,'Mensual') || strcmp(Resolution,'Anual')
    
    if strcmp(Resolution,'Mensual')
        Table_i = table(Results.Date, Results.Data, year(Results.Date), month(Results.Date), day(Results.Date),...
        'VariableNames',{'Date','Value','Y','M','D'});

        Tmp     = table2array(varfun(MyFun,Table_i,'GroupingVariables',{'Y','M'},'InputVariable','Value'));
        Date    = datetime(Tmp(:,1), Tmp(:,2), Tmp(:,1)*0 + 1, Tmp(:,1)*0, Tmp(:,1)*0, Tmp(:,1)*0);
        Data    = Tmp(:,4:end);
    elseif strcmp(Resolution,'Anual')
        Table_i = table(Results.Date, Results.Data, year(Results.Date), month(Results.Date), day(Results.Date),...
        'VariableNames',{'Date','Value','Y','M','D'});

        Tmp     = table2array(varfun(MyFun,Table_i,'GroupingVariables',{'Y'},'InputVariable','Value'));
        Date    = datetime(Tmp(:,1), Tmp(:,1)*0 + 1, Tmp(:,1)*0 + 1, Tmp(:,1)*0, Tmp(:,1)*0, Tmp(:,1)*0);
        Data    = Tmp(:,3:end);
    end
    
else
    if mod(Results.Fil,Resolution) == 0
        Step    = floor(Results.Fil/Resolution);
    else
        Step    = floor(Results.Fil/Resolution) + 1;
    end

    %% Read File
    Data = zeros(Step, Results.Col);

    for i = 1:Results.Col

        if mod(Results.Fil,Resolution) == 0
            Step    = floor(Results.Fil/Resolution);
            % Time Series - Tmp
            Tmp     = Results.Data(:,i);
        else
            Step    = floor(Results.Fil/Resolution) + 1;
            Tmp     = NaN(Step*Resolution, 1);
            Tmp(1:Results.Fil) = Results.Data(:,i);
        end

        % Reshape
        Tmp = reshape(Tmp,Resolution,[]);

        % Aggregation   
        Data(:,i) = MyFun(Tmp)';
    end
    Date = Results.Date(1:Resolution:(Step*Resolution));    
end

ResultsAgg      = Results;
ResultsAgg.Date = Date;
ResultsAgg.Data = Data;
