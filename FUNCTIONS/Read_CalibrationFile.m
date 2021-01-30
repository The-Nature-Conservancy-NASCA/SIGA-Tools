function UserData = Read_CalibrationFile(PathFile)

%% Abrir Archivo
ID_File  = fopen(PathFile,'r');

%% Leer primera linea
LineText = char('Init while');

%% Contador
i = 1;

%% Almacenamiento
UserData.Met = [];
UserData.Veg = [];
UserData.Fen = [];
UserData.Hid = [];
UserData.Sed = [];
UserData.Geo = [];

while ischar(LineText)
    
    % Leer nueva linea
    LineText = fgetl(ID_File);    
    
    if i == 3
        % Parametros del modelo meteorológico
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);
        UserData.Met = Tmp;
     
    elseif (i >= 7) && (i <= 40)
        % Parametros del modelo de vegetación
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);
        UserData.Veg = [UserData.Veg; Tmp];
        
    elseif (i >= 44) && (i <= 85)
        % Factores del modelo fenológico
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);
        UserData.Fen = [UserData.Fen; Tmp];
        
    elseif i == 89
        % Factores del modelo hidrológico
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);
        UserData.Hid = Tmp;
        
    elseif i == 93
        % Factores del modelo sedimentológico
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);
        UserData.Sed = Tmp;
        
    elseif i == 97
        % Factores del modelo geotécnico
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);
        UserData.Geo = Tmp;
    end
    
    i = i + 1;
end

%% Cerrar Archivo
fclose(ID_File);