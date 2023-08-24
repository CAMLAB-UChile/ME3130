function U2_problema4
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
% Solución: Problema 4.
% Unidad 2: Cuerpos Rígidos. Sistemas Equivalentes de Fuerzas.
%-------------------------------------------------------------------------------

  clc
  close all
  clear all

  %% Problema 3.39 Ref. [1] 

  fprintf('Referencias:\n');
  fprintf(['[1] Beeer, Johnston, Mazurek, Mecánica Vectorial para'...
           ' Ingenieros: Estática, Undécima Edición, McGraw Hill Education.\n\n']);   
  fprintf('Problema 3.39 Ref. [1]\n');
  fprintf('----------------------\n\n');  

  fprintf('Letra a):\n\n');
 
  % cálculo del ángulo
  d_ca = [-6, 2, 3];
  d_ba = [-6, -4.5, 0];
  cos_theta = dot(d_ca,d_ba)/(norm(d_ca)*norm(d_ba));
  theta = acos(cos_theta);

  % impresión de resultados
  fprintf('d_ca = [%f ft, %f ft, %f ft]\n',d_ca);
  fprintf('d_ba = [%f ft, %f ft, %f ft]\n',d_ba);  
  fprintf('theta = dot(d_ca,d_ba)/(norm(d_ca)*norm(d_ba)) = %f°\n\n',theta*180/pi());

  fprintf('Letra b):\n\n');

  % Datos
  T_AC_mag = 280; 

  % proyección de T_AC sobre AB
  lambda_BA_mag = 1;
  P_AB = T_AC_mag*lambda_BA_mag*cos_theta;

  % impresión de resultados
  fprintf('||T_AC|| = %f lbf\n',T_AC_mag);
  fprintf('||lambda_BA|| = %f\n',lambda_BA_mag);  
  fprintf('P_AB = dot(T_AC,lambda_BA) = ||T_AC|| ||lambda_BA|| cos(theta) = ||T_AC|| cos(theta) = %f lbf\n\n',P_AB);

end
