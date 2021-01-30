function UserData = Read_ExecutionFile(PathFile)

% Abrir Archivo
ID_File = fopen(PathFile,'r');

% Leer primera linea
LineText = char('Init while');

% Contador
i = 0;

while ischar(LineText)
    
    % Leer nueva linea
    LineText = fgetl(ID_File);    
    
    % Control para leer datos
    Status = logical(strfind(LineText,'['));
    if isempty(LineText), Status = true; end
    
    if Status
        continue
    else
        % Contador
        i = i + 1;
    end
    
    % TimeSeries Number
    if i == 1        
        UserData.NameSce    = LineText;
    elseif i == 2
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);        
        UserData.DateInit   = datetime(Tmp);
    elseif i == 3
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);   
        UserData.DateEnd    = datetime(Tmp);
    elseif i == 4
        UserData.dt         = str2double(LineText);
    elseif i == 5
        UserData.Topo       = LineText;
    elseif i == 6
        UserData.Tmin       = LineText;
    elseif i == 7
        UserData.Tmax       = LineText;
    elseif i == 8
        UserData.HR         = LineText;
    elseif i == 9
        UserData.RS         = LineText;
    elseif i == 10
        UserData.P          = LineText;    
    elseif i == 11
        UserData.VZ         = LineText;
    elseif i == 12
        UserData.VM         = LineText;
    elseif i == 13
        UserData.Q_LD       = LineText;
    elseif i == 14
        UserData.Q_LC       = LineText;
    elseif i == 15
        UserData.Arcillas   = LineText;
    elseif i == 16
        UserData.Limos      = LineText;
    elseif i == 17
        UserData.Arenas     = LineText;
    elseif i == 18
        UserData.MM         = LineText;
    elseif i == 19
        UserData.F_Cal      = LineText;
    elseif i == 20
        UserData.M_Results  = LineText;
    elseif i == 21
        UserData.Time_Res   = LineText;
    end
    
end
% Cerrar Archivo
fclose(ID_File);


