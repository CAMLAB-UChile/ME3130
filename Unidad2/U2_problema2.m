function U2_problema2
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
% Solución: Problema 2.
% Unidad 2: Cuerpos Rígidos. Sistemas Equivalentes de Fuerzas.
%-------------------------------------------------------------------------------

  clc
  close all
  clear all

  %% Problema 3.11 Ref. [1] 

  fprintf('Referencias:\n');
  fprintf(['[1] Beeer, Johnston, Mazurek, Mecánica Vectorial para'...
           ' Ingenieros: Estática, Undécima Edición, McGraw Hill Education.\n\n']);  
  fprintf('Problema 3.11 Ref. [1]\n');
  fprintf('----------------------\n\n');  

  % Datos
  F_mag = 125;

  % cálculo del momento
  r_ba = [15.3, -14.33, 0];
  cos_theta = 12/sqrt(12^2+2.33^2);
  sin_theta = 2.33/sqrt(12^2+2.33^2);
  F = [F_mag*cos_theta, -F_mag*sin_theta, 0];
  M_A = cross(r_ba,F);

  % impresión de resultados
  fprintf('r_ba = [%f in, %f in, %f in]\n',r_ba);
  fprintf('F = [%f lbf, %f lbf, %f lbf]\n',F);  
  fprintf('M_A = r_ba x F = cross(r_ba,F) = [%f lbf-in, %f lbf-in, %f lbf-in]\n\n',M_A);

  % ploteo de vectores
  % vector r_ba
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,r_ba,'LineWidth',1.5,'MaxHeadSize',4.0); % plotea el vector v1 con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view(3);
  % vector F
  x0 = r_ba; % origen del vector
  plotvec3d(x0,F,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector v2 con origen en x0  
  % vector M_A
  x0 = [0,0,0]; % origen del vector  
  plotvec3d(x0,M_A/10,'LineWidth',1.5,'MaxHeadSize',0.15); % plotea el vector v1 con origen en x0
  %
  legend('r_{ba} (in)','F (lbf)','M_A x 10 (lbf-in)','Location','eastoutside');     
  title(['M_A = [',num2str(M_A(1)/10),', ',num2str(M_A(2)/10),', ',num2str(M_A(3)/10),'] x 10']);   

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