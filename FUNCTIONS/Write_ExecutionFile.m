function Write_ExecutionFile(PathFile, UserData)

%% Abrir Archivo
ID_File = fopen(PathFile,'w');

%% Guardar Niombre de Scenario
fprintf(ID_File,'[NOMBRE DEL ESCENARIO]\n');
fprintf(ID_File,UserData.NameSce);
fprintf(ID_File,'\n\n');

%% Guardar Fecha de inicio de la simulación
fprintf(ID_File,'[FECHA DE INICIO DE LA SIMULACIÓN] Año Mes Día\n');
Y = num2str(year(UserData.DateInit));
M = num2str(month(UserData.DateInit));
D = num2str(day(UserData.DateInit));
fprintf(ID_File,[Y,' ',M,' ',D]);
fprintf(ID_File,'\n\n');

%% Guardar Fecha de finalización de Simulación
fprintf(ID_File,'[FECHA DE FINALIZACIÓN DE LA SIMULACIÓN] Año Mes Día\n');
Y = num2str(year(UserData.DateEnd));
M = num2str(month(UserData.DateEnd));
D = num2str(day(UserData.DateEnd));
fprintf(ID_File,[Y,' ',M,' ',D]);
fprintf(ID_File,'\n\n');

%% Guardar Tamaño del paso temporal de Simulación en días
fprintf(ID_File,'[TAMAÑO DE PASO TEMPORAL DE SIMULACIÓN EN DÍAS]\n');
fprintf(ID_File,'%0.1f',num2str(UserData.dt));
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de Topología
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE TOPOLOGÍA]\n');
fprintf(ID_File,UserData.Topo);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de Temperatura Mínima
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE TEMPERATURA MÍNIMA]\n');
fprintf(ID_File,UserData.Tmin);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de Temperatura Máxima
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE TEMPERATURA MÁXIMA]\n');
fprintf(ID_File,UserData.Tmax);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de Humedad Relativa
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE HUMEDAD RELATIVA]\n');
fprintf(ID_File,UserData.HR);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de Radiación solar
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE RADIACIÓN SOLAR]\n');
fprintf(ID_File,UserData.RS);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de precipitación
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE PRECIPITACIÓN]\n');
fprintf(ID_File,UserData.P);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de viento zonal
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE VIENTO ZONAL]\n');
fprintf(ID_File,UserData.VZ);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de viento meridional
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE VIENTO MERIDIONAL]\n');
fprintf(ID_File,UserData.VM);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo dede caudal liquido descargado
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE CAUDAL LÍQUIDO DESCARGADO]\n');
fprintf(ID_File,UserData.Q_LD);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de caudal liquido captado
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE CAUDAL LÍQUIDO CAPTADO]\n');
fprintf(ID_File,UserData.Q_LC);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de series de tiempo de arcillas mezcladas
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE ARCILLAS MEZCLADAS EN DESCARGAS]\n');
fprintf(ID_File,UserData.Arcillas);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de series de timempo de limis mezcaldos
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE LIMOS MEZCLADAS EN DESCARGAS]\n');
fprintf(ID_File,UserData.Limos);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de series de tiempo de arenas mezcladas
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE ARENAS MEZCLADAS EN DESCARGAS]\n');
fprintf(ID_File,UserData.Arenas);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de movimientos en masa
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE MOVIMIENTOS EN MASA]\n');
fprintf(ID_File,UserData.MM);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de factores de calibración
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE FACTORES DE CALIBRACIÓN]\n');
fprintf(ID_File,UserData.F_Cal);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de muestreador de resultados
fprintf(ID_File,'[NOMBRE DEL ARCHIVO MUESTREADOR DE RESULTADOS]\n');
fprintf(ID_File,UserData.M_Results);
fprintf(ID_File,'\n\n');

%% Guardar Nombre del Archivo de tiempo de tasas de restauración
fprintf(ID_File,'[NOMBRE DEL ARCHIVO DE SERIES DE TIEMPO DE TASAS DE RESTAURACIÓN]\n');
fprintf(ID_File,UserData.Time_Res);

%% Cerrar Archivo
fclose(ID_File);
