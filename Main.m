clc
clear all
close all

punto=input('Ingrese el punto que quiere realizar: ');

if punto==3

    %%% Punto 3 %%%

    load('DatosRegresion.mat');
    Xreg=Xreg(:,1:6);
    
    %%% Se hace la partici�n entre los conjuntos de entrenamiento y prueba.
    %%% Esta partici�n se hace forma aletoria %%%

    N=size(Xreg,1);

    porcentaje=N*0.7;
    rng('default');
    ind=randperm(N); %%% Se seleccionan los indices de forma aleatoria

    Xtrain=Xreg(ind(1:porcentaje),:);
    Xtest=Xreg(ind(porcentaje+1:end),:);
    Ytrain=Yreg(ind(1:porcentaje),:);
    Ytest=Yreg(ind(porcentaje+1:end),:);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Normalizaci�n %%%

    [Xtrain,mu,sigma]=zscore(Xtrain);
    Xtest=normalizar(Xtest,mu,sigma);

    %%%%%%%%%%%%%%%%%%%%%

    %%% Se aplica la regresi�n usando KNN  %%%

    k=7;
    [dis,Yesti]=vecinosCercanos(Xtest,Xtrain,Ytrain,k,'regress');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Se encuentra el error cuadratico medio %%%

    ECM=(sum((Yesti-Ytest).^2))/length(Ytest);

    Texto=strcat('El Error cuadr�tico medio en prueba es: ',{' '},num2str(ECM));
    disp(Texto);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Fin Punto 3 %%%

elseif punto==4
    
    %%% Punto 4 %%%

    load('DatosRegresion.mat');
    Xreg=Xreg(:,1:6);
    
    %%% Se hace la partici�n entre los conjuntos de entrenamiento y prueba.
        %%% Esta partici�n se hace forma aletoria %%%

    N=size(Xreg,1);

    porcentaje=N*0.7;
    rng('default');
    ind=randperm(N); %%% Se seleccionan los indices de forma aleatoria

    Xtrain=Xreg(ind(1:porcentaje),:);
    Xtest=Xreg(ind(porcentaje+1:end),:);
    Ytrain=Yreg(ind(1:porcentaje),:);
    Ytest=Yreg(ind(porcentaje+1:end),:);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Normalizaci�n %%%

    [Xtrain,mu,sigma]=zscore(Xtrain);
    Xtest=normalizar(Xtest,mu,sigma);

    %%%%%%%%%%%%%%%%%%%%%

    %%% Se aplica la regresi�n usando ventana de parzen  %%%

    h=10;
    Yesti=ventanaParzen(Xtest,Xtrain,Ytrain,h,'regress');

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Se encuentra el error cuadratico medio %%%

    ECM=(sum((Yesti-Ytest).^2))/length(Ytest);

    Texto=strcat('El Error cuadr�tico medio en prueba es: ',{' '},num2str(ECM));
    disp(Texto);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Fin Punto 4 %%%
    
elseif punto==5
    
    %%% Punto 5 %%%

    load('DatosClasificacion.mat');
    Xclas=Xclas(:,1:3);
    
    %%% Se hace la partici�n entre los conjuntos de entrenamiento y prueba.
    %%% Esta partici�n se hace forma aletoria %%%
    
    N=size(Xclas,1);

    porcentaje=N*0.7;
    rng('default');
    ind=randperm(N); %%% Se seleccionan los indices de forma aleatoria

    Xtrain=Xclas(ind(1:porcentaje),:);
    Xtest=Xclas(ind(porcentaje+1:end),:);
    Ytrain=Yclas(ind(1:porcentaje),:);
    Ytest=Yclas(ind(porcentaje+1:end),:);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Normalizaci�n %%%
    
    [Xtrain,mu,sigma]=zscore(Xtrain);
    Xtest=normalizar(Xtest,mu,sigma);
    
    %%%%%%%%%%%%%%%%%%%%%

    %%% Se aplica la clasificaci�n con KNN %%%
    
    k=25;
    Yesti=vecinosCercanos(Xtest,Xtrain,Ytrain,k,'class'); 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Se encuentra la eficiencia y el error de clasificaci�n %%%
      
    Eficiencia=(sum(Yesti==Ytest))/length(Ytest);
    Error=1-Eficiencia;
    
    Texto=strcat('La eficiencia en prueba es: ',{' '},num2str(Eficiencia));
    disp(Texto);
    Texto=strcat('El error de clasificaci�n en prueba es: ',{' '},num2str(Error));
    disp(Texto);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Fin Punto 5 %%%
    
elseif punto==6
    
    %%% Punto 6 %%%

    load('DatosClasificacion.mat');
    Xclas=Xclas(:,1:3);
    
    %%% Se hace la partici�n entre los conjuntos de entrenamiento y prueba.
    %%% Esta partici�n se hace forma aletoria %%%
    
    N=size(Xclas,1);

    porcentaje=N*0.7;
    rng('default');
    ind=randperm(N); %%% Se seleccionan los indices de forma aleatoria

    Xtrain=Xclas(ind(1:porcentaje),:);
    Xtest=Xclas(ind(porcentaje+1:end),:);
    Ytrain=Yclas(ind(1:porcentaje),:);
    Ytest=Yclas(ind(porcentaje+1:end),:);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Normalizaci�n %%%
    
    [Xtrain,mu,sigma]=zscore(Xtrain);
    Xtest=normalizar(Xtest,mu,sigma);
    
    %%%%%%%%%%%%%%%%%%%%%
    
    %%% Se parte el conjunto de entrenamiento en un conjunto por cada
    %%% clase. En este caso 3 clases %%%
    
    ind1=Ytrain==1;
    ind2=Ytrain==2;
    ind3=Ytrain==3;
    
    Xtrain1=Xtrain(ind1,:);
    Xtrain2=Xtrain(ind2,:);
    Xtrain3=Xtrain(ind3,:);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Se aplica la clasificaci�n con ventana de parzen %%%
    
    h=0.05;
    funcion1=ventanaParzen(Xtest,Xtrain1,Ytrain,h,'class');
    funcion2=ventanaParzen(Xtest,Xtrain2,Ytrain,h,'class');
    funcion3=ventanaParzen(Xtest,Xtrain3,Ytrain,h,'class');
    
    funcion=[funcion1,funcion2,funcion3];
    
    [~,Yesti]=max(funcion,[],2);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% Se encuentra la eficiencia y el error de clasificaci�n %%%
      
    Eficiencia=(sum(Yesti==Ytest))/length(Ytest);
    Error=1-Eficiencia;
    
    Texto=strcat('La eficiencia en prueba es: ',{' '},num2str(Eficiencia));
    disp(Texto);
    Texto=strcat('El error de clasificaci�n en prueba es: ',{' '},num2str(Error));
    disp(Texto);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Fin Punto 6 %%%

end




