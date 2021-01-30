function Write_CalibrationFile(PathFile, UserData)

%% Abrir Archivo
ID_File = fopen(PathFile,'w');

%% Guardar Factores del modelo meteorológico
fprintf(ID_File,'[FACTORES DEL MODELO METEOROLÓGICO]\n');
fprintf(ID_File,'minTAmin maxTAmin minTAmax maxTAmax minHR maxHR minRS ');
fprintf(ID_File,'maxRS minPV maxPV minUx maxUx minUy maxUy p Ez1 Ez2\n');
n = ['%f',repmat(' %f',1,length(UserData.Met)-1),'\n'];
fprintf(ID_File,n,UserData.Met);
fprintf(ID_File,'\n');

%% Guardar Factores del modelo de restauración de la vegetación
fprintf(ID_File,'[FACTORES DEL MODELO DE RESTAURACIÓN DE LA VEGETACIÓN]\n');
fprintf(ID_File,'transicion CLC deltatm accion\n');
n = ['%d',repmat(' %f',1,length(UserData.Veg(1,:))-1),'\n'];
fprintf(ID_File,n,UserData.Veg');
fprintf(ID_File,'\n');

%% Guardar Factores del modelo fenológico
fprintf(ID_File,'[FACTORES DEL MODELO FENOLÓGICO]\n');
fprintf(ID_File,'CLC psi theta n2 C_usle LAImax LAImin PHU l1 l2 l3 ');
fprintf(ID_File,'frPHUsen SMIc nSMI TAinf TAsup SOS1 SOS2 KCmin KCmax eta\n');
n = ['%d',repmat(' %f',1,length(UserData.Fen(1,:))-1),'\n'];
fprintf(ID_File,n,UserData.Fen');
fprintf(ID_File,'\n');

%% Guardar Factores del modelo hidrológico
fprintf(ID_File,'[FACTORES DEL MODELO HIDROLÓGICO]\n');
fprintf(ID_File,'fc_PV fc_PH fc_SU0 fc_SU1 fc_SU3 fc_ks fc_kp fc_ki fc_U2 ');
fprintf(ID_File,'fc_U3 fc_U4 fc_U5 us ui\n');
n = ['%f',repmat(' %f',1,length(UserData.Hid)-1),'\n'];
fprintf(ID_File,n,UserData.Hid);
fprintf(ID_File,'\n');

%% Guardar Factores del modelo sedimentológico
fprintf(ID_File,'[FACTORES DEL MODELO SEDIMENTOLÓGICO]\n');
fprintf(ID_File,'fc_E2Smax fc_E5Smax Bx b Us_arc Us_lim Us_are Ds_arc Ds_lim ');
fprintf(ID_File,'Ds_are Gs Rs\n');
n = ['%f',repmat(' %f',1,length(UserData.Sed)-1),'\n'];
fprintf(ID_File,n,UserData.Sed);
fprintf(ID_File,'\n');

%% Guardar Factores del modelo geotécnico
fprintf(ID_File,'[FACTORES DEL MODELO GEOTÉCNICO]\n');
fprintf(ID_File,'fc_c fc_phi fc_rhoB fc_HS alfa_crit alfa_stop a_stop\n');
n = ['%f',repmat(' %f',1,length(UserData.Geo)-1),'\n'];
fprintf(ID_File,n,UserData.Geo);
fprintf(ID_File,'\n');

%% Cerrar Archivo
fclose(ID_File);