function U2_problema6
% ME3130: Mecánica Estática
% Departamento de Ingeniería Mecánica
% Universidad de Chile
%
% Profesor : A. Ortiz Bernardin
% E-mail   : aortizb@uchile.cl
% Web      : https://camlab.cl/alejandro/
%
% Referencias:
% 
% [1] Beeer, Johnston, Mazurek, Mecánica Vectorial para Ingenieros: Estática,
%     Undécima Edición, McGraw Hill Education.
%
%-------------------------------------------------------------------------------
% Solución: Problema 6.
% Unidad 2: Cuerpos Rígidos. Sistemas Equivalentes de Fuerzas.
%-------------------------------------------------------------------------------

  clc
  close all
  clear all

  %% Problema 3.57 Ref. [1] 

  fprintf('Referencias:\n');
  fprintf(['[1] Beeer, Johnston, Mazurek, Mecánica Vectorial para'...
           ' Ingenieros: Estática, Undécima Edición, McGraw Hill Education.\n\n']);  
  fprintf('Problema 3.57 Ref. [1]\n');
  fprintf('----------------------\n\n');  

  % Datos
  T_BH_mag = 450;

  % vector unitario a lo largo de BH
  lambda_HB = [0.375, 0.75, -0.75]/sqrt(0.375^2+0.75^2+0.75^2);

  % cálculo del vector tensión en el cable BH
  T_BH = T_BH_mag*lambda_HB;

  % cálculo del vector distancia desde A hasta B
  r_BA = [0.5, 0, 0];

  % cálculo del momento M_A
  M_A = cross(r_BA,T_BH);

  % cálculo del momento ejercido por T_BH con respecto a la diagonal AD
  lambda_DA = [1, 0, -0.75]/sqrt(1^2+0.75^2+0^2); % vector unitario a lo largo de AD
  M_AD = dot(lambda_DA,M_A);

  % impresión de resultados
  fprintf('||T_BH|| = %f N\n',T_BH_mag);
  fprintf('lambda_HB = [%f, %f, %f]\n',lambda_HB);  
  fprintf('T_BH = ||T_BH||*lambda_HB = [%f N, %f N, %f N]\n',T_BH);
  fprintf('r_BA = [%f m, %f m, %f m]\n',r_BA);  
  fprintf('M_A = r_BA x T_BH = cross(r_BA,T_BH) = [%f N-m, %f N-m, %f N-m]\n\n',M_A);
  fprintf('lambda_DA = [%f, %f, %f]\n',lambda_DA);   
  fprintf('M_AD = lambda_DA * M_A = dot(lambda_DA,M_A) = %f N-m\n\n',M_AD);  

end
