function UserData = Read_MuestreadorFile(PathFile)

% PathFile = 'Z:\Dummy-SIGA\Chivor\entradas\muestras\muestreador.txt';

%% Abrir Archivo
ID_File = fopen(PathFile,'r');

%% Leer primera linea
LineText = char('Init while');

%% Contador
i = 1;
j = 1;
k = 1;

%% Estructura de Almacenamiento
UserData.Num_PC     = [];
UserData.Var_PC     = [];
UserData.Num_TC     = [];
UserData.Var_TC     = [];
UserData.Var_Map    = [];
UserData.Num_PC     = 100;
UserData.Var_TC     = 100;

while ischar(LineText)
    
    % Leer nueva linea
    LineText = fgetl(ID_File);        
         
    if i == 2        
        % Numero de Puntos de Control
        UserData.Num_PC   = str2double(LineText);
        
    elseif i == 6
        % Listado de Variables para puntos de control
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);        
        UserData.Var_PC   = logical(Tmp);
        
    elseif (i >= 10) && (i <= (10 + UserData.Num_PC - 1))
        % Listado de Puntos de control
        Tmp = strsplit(LineText,' ');
        Tmp{1} = str2double(Tmp{1});
        Tmp{2} = str2double(Tmp{2});
        if j == 1
            UserData.PC = cell(UserData.Num_PC,4);
            UserData.PC(j,:) = Tmp;
        else            
            UserData.PC(j,:) = Tmp;
        end
        j = j + 1;
        
    elseif i == (10 + UserData.Num_PC + 2)
        % Numero de Tramos de control
        UserData.Num_TC    = str2double(LineText);
        
    elseif i == (10 + UserData.Num_PC + 2 + 4)
        % Listado de variables para tramos de control
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);        
        UserData.Var_TC   = logical(Tmp);
        
    elseif (i >= (20 + UserData.Num_PC)) && (i <= (20 + UserData.Num_PC + UserData.Num_TC - 1))
        % Listado de tramos de control
        Tmp = strsplit(LineText,' ');
        Tmp{1} = str2double(Tmp{1});
        Tmp{2} = str2double(Tmp{2});
        Tmp{3} = str2double(Tmp{3});
        Tmp{4} = str2double(Tmp{4});
        if k == 1
            UserData.TC = cell(UserData.Num_TC,5);
            UserData.TC(k,:) = Tmp;
        else
            UserData.TC(k,:) = Tmp;
        end
        k = k + 1;
    elseif i == (24 + UserData.Num_PC + UserData.Num_TC - 1)
        % Listado de variables para mapas
        Tmp = strsplit(LineText,' ');
        Tmp = cellfun(@str2num,Tmp);        
        UserData.Var_Map   = logical(Tmp);
    end
    
    i = i + 1;
end

%% Cerrar Archivo
fclose(ID_File);