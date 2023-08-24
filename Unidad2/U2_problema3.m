function U2_problema3
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
% Solución: Problema 3.
% Unidad 2: Cuerpos Rígidos. Sistemas Equivalentes de Fuerzas.
%-------------------------------------------------------------------------------

  clc
  close all
  clear all

  %% Problema 3.23 Ref. [1] 

  fprintf('Referencias:\n');
  fprintf(['[1] Beeer, Johnston, Mazurek, Mecánica Vectorial para'...
           ' Ingenieros: Estática, Undécima Edición, McGraw Hill Education.\n\n']);  
  fprintf('Problema 3.23 Ref. [1]\n');
  fprintf('----------------------\n\n');  

  % Datos
  F_mag = 200;

  % cálculo del momento
  r_ca = [60, 75, 0];
  F = [0, -F_mag*cos(30*pi()/180), F_mag*cos(60*pi()/180)];
  M_A = cross(r_ca,F);

  % impresión de resultados
  fprintf('r_ca = [%f mm, %f mm, %f mm]\n',r_ca);
  fprintf('F = [%f N, %f N, %f N]\n',F);  
  fprintf('M_A = r_ca x F = cross(r_ca,F) = [%f N-mm, %f N-mm, %f N-mm]\n\n',M_A);

  % ploteo de vectores
  % vector r_ca
  figure; % define una nueva figura
  x0 = [0,-50,0]; % origen del vector
  plotvec3d(x0,r_ca,'LineWidth',1.5,'MaxHeadSize',1.8); % plotea el vector v1 con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([165,-60]);
  % vector F
  x0 = [60, 25, 0]; % origen del vector
  plotvec3d(x0,F,'LineWidth',1.5,'MaxHeadSize',0.6); % plotea el vector v2 con origen en x0  
  % vector M_A
  x0 = [0,-50,0]; % origen del vector  
  plotvec3d(x0,M_A/100,'LineWidth',1.5,'MaxHeadSize',0.8); % plotea el vector v1 con origen en x0
  %
  legend('r_{ca} (mm)','F (N)','M_A x 100 (N-mm)','Location','eastoutside');     
  title(['M_A = [',num2str(M_A(1)/100),', ',num2str(M_A(2)/100),', ',num2str(M_A(3)/100),'] x 100']);   

end

function plotvec3d(x0,dx,LineWidthStr,LineWidthVal,MaxHeadSizeStr,MaxHeadSizeVal)
  if length(x0)~=3 || length(dx)~=3
    error('x0 y dx deben ser arreglos de dimension 3'); 
  end
  quiver3(x0(1),x0(2),x0(3),dx(1),dx(2),dx(3),'off',...
          LineWidthStr,LineWidthVal,MaxHeadSizeStr,MaxHeadSizeVal);

  xlabel('X');
  ylabel('Y');
  zlabel('Z');
  axis equal;  
end