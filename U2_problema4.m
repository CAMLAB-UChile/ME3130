function U2_problema4
% ME3130: Mec�nica Est�tica
% Departamento de Ingenier�a Mec�nica
% Universidad de Chile
%
% Profesor : A. Ortiz Bernardin
% E-mail   : aortizb@uchile.cl
% Web      : https://camlab.cl/alejandro/
%
% Referencias:
% 
% [1] Beeer, Johnston, Mazurek, Mec�nica Vectorial para Ingenieros: Est�tica,
%     Und�cima Edici�n, McGraw Hill Education.
%
%-------------------------------------------------------------------------------
% Soluci�n: Problema 4.
% Unidad 2: Cuerpos R�gidos. Sistemas Equivalentes de Fuerzas.
%-------------------------------------------------------------------------------

  clc
  close all
  clear all

  %% Problema 3.39 Ref. [1] 

  fprintf('Referencias:\n');
  fprintf(['[1] Beeer, Johnston, Mazurek, Mec�nica Vectorial para'...
           ' Ingenieros: Est�tica, Und�cima Edici�n, McGraw Hill Education.\n\n']);   
  fprintf('Problema 3.39 Ref. [1]\n');
  fprintf('----------------------\n\n');  

  fprintf('Letra a):\n\n');
 
  % c�lculo del �ngulo
  d_ca = [-6, 2, 3];
  d_ba = [-6, -4.5, 0];
  cos_theta = dot(d_ca,d_ba)/(norm(d_ca)*norm(d_ba));
  theta = acos(cos_theta);

  % impresi�n de resultados
  fprintf('d_ca = [%f ft, %f ft, %f ft]\n',d_ca);
  fprintf('d_ba = [%f ft, %f ft, %f ft]\n',d_ba);  
  fprintf('theta = dot(d_ca,d_ba)/(norm(d_ca)*norm(d_ba)) = %f�\n\n',theta*180/pi());

  fprintf('Letra b):\n\n');

  % Datos
  T_AC_mag = 280; 

  % proyecci�n de T_AC sobre AB
  lambda_BA_mag = 1;
  P_AB = T_AC_mag*lambda_BA_mag*cos_theta;

  % impresi�n de resultados
  fprintf('||T_AC|| = %f lbf\n',T_AC_mag);
  fprintf('||lambda_BA|| = %f\n',lambda_BA_mag);  
  fprintf('P_AB = dot(T_AC,lambda_BA) = ||T_AC|| ||lambda_BA|| cos(theta) = ||T_AC|| cos(theta) = %f lbf\n\n',P_AB);

end
