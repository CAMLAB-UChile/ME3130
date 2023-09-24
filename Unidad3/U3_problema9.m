function U3_problema9
% ME3130: Mecánica Estática
% Departamento de Ingeniería Mecánica
% Universidad de Chile
%
% Profesor : A. Ortiz Bernardin
% E-mail   : aortizb@uchile.cl
% Web      : https://camlab.cl/alejandro/

  clc
  close all
  clear all


  %% Método 1
  fprintf('Método 1: Se encuentran 2 ecuaciones tomando momentos con respecto a A y B.\n\n');  
  K = [-60 0; 0 60];
  f = [900*50-2100*40; 900*110+2100*20];
  u = K\f;
  fprintf('El sistema matricial K*u = f es:\n\n');
  fprintf('K = [%f %f; %f %f]\n',K(1,1),K(1,2),K(2,1),K(2,2));
  fprintf('f = [%f; %f]\n\n',f);
  fprintf('La solución es: u = (K^-1)f = [%f; %f]\n\n',u);
  fprintf('Como hay 2 ruedas delanteras y 2 ruedas traseras:\n');
  fprintf('Reacción en 1 rueda delantera = By/2 = u(2)/2 = %f\n',u(2)/2);
  fprintf('Reacción en 1 rueda trasera = Ay/2 = u(1)/2 = %f\n\n',u(1)/2);  

  %% Método 2
  fprintf('Método 2: Se encuentran 2 ecuaciones tomando momentos con respecto a A y sumando fuerzas en el eje y.\n\n');  
  K = [1 1; 0 60];
  f = [2100+900; 900*110+2100*20];
  u = K\f;
  fprintf('El sistema matricial K*u = f es:\n\n');
  fprintf('K = [%f %f; %f %f]\n',K(1,1),K(1,2),K(2,1),K(2,2));
  fprintf('f = [%f; %f]\n\n',f);
  fprintf('La solución es: u = (K^-1)f = [%f; %f]\n\n',u);
  fprintf('Como hay 2 ruedas delanteras y 2 ruedas traseras:\n');
  fprintf('Reacción en 1 rueda delantera = By/2 = u(2)/2 = %f\n',u(2)/2);
  fprintf('Reacción en 1 rueda trasera = Ay/2 = u(1)/2 = %f\n\n',u(1)/2);   
end


