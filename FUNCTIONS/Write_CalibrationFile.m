function Write_CalibrationFile(PathFile, UserData)

%% Abrir Archivo
ID_File = fopen(PathFile,'w');

%% Guardar Factores del modelo meteorol�gico
fprintf(ID_File,'[FACTORES DEL MODELO METEOROL�GICO]\n');
fprintf(ID_File,'minTAmin maxTAmin minTAmax maxTAmax minHR maxHR minRS ');
fprintf(ID_File,'maxRS minPV maxPV minUx maxUx minUy maxUy p Ez1 Ez2\n');
n = ['%f',repmat(' %f',1,length(UserData.Met)-1),'\n'];
fprintf(ID_File,n,UserData.Met);
fprintf(ID_File,'\n');

%% Guardar Factores del modelo de restauraci�n de la vegetaci�n
fprintf(ID_File,'[FACTORES DEL MODELO DE RESTAURACI�N DE LA VEGETACI�N]\n');
fprintf(ID_File,'transicion CLC deltatm accion\n');
n = ['%d',repmat(' %f',1,length(UserData.Veg(1,:))-1),'\n'];
fprintf(ID_File,n,UserData.Veg');
fprintf(ID_File,'\n');

%% Guardar Factores del modelo fenol�gico
fprintf(ID_File,'[FACTORES DEL MODELO FENOL�GICO]\n');
fprintf(ID_File,'CLC psi theta n2 C_usle LAImax LAImin PHU l1 l2 l3 ');
fprintf(ID_File,'frPHUsen SMIc nSMI TAinf TAsup SOS1 SOS2 KCmin KCmax eta\n');
n = ['%d',repmat(' %f',1,length(UserData.Fen(1,:))-1),'\n'];
fprintf(ID_File,n,UserData.Fen');
fprintf(ID_File,'\n');

%% Guardar Factores del modelo hidrol�gico
fprintf(ID_File,'[FACTORES DEL MODELO HIDROL�GICO]\n');
fprintf(ID_File,'fc_PV fc_PH fc_SU0 fc_SU1 fc_SU3 fc_ks fc_kp fc_ki fc_U2 ');
fprintf(ID_File,'fc_U3 fc_U4 fc_U5 us ui\n');
n = ['%f',repmat(' %f',1,length(UserData.Hid)-1),'\n'];
fprintf(ID_File,n,UserData.Hid);
fprintf(ID_File,'\n');

%% Guardar Factores del modelo sedimentol�gico
fprintf(ID_File,'[FACTORES DEL MODELO SEDIMENTOL�GICO]\n');
fprintf(ID_File,'fc_E2Smax fc_E5Smax Bx b Us_arc Us_lim Us_are Ds_arc Ds_lim ');
fprintf(ID_File,'Ds_are Gs Rs\n');
n = ['%f',repmat(' %f',1,length(UserData.Sed)-1),'\n'];
fprintf(ID_File,n,UserData.Sed);
fprintf(ID_File,'\n');

%% Guardar Factores del modelo geot�cnico
fprintf(ID_File,'[FACTORES DEL MODELO GEOT�CNICO]\n');
fprintf(ID_File,'fc_c fc_phi fc_rhoB fc_HS alfa_crit alfa_stop a_stop\n');
n = ['%f',repmat(' %f',1,length(UserData.Geo)-1),'\n'];
fprintf(ID_File,n,UserData.Geo);
fprintf(ID_File,'\n');

%% Cerrar Archivo
fclose(ID_File);