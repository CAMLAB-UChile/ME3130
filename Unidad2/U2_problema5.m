function U2_problema5
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
% Solución: Problema 5.
% Unidad 2: Cuerpos Rígidos. Sistemas Equivalentes de Fuerzas.
%-------------------------------------------------------------------------------

  clc
  close all
  clear all

  %% Problema 3.47 Ref. [1] 

  fprintf('Referencias:\n');
  fprintf(['[1] Beeer, Johnston, Mazurek, Mecánica Vectorial para'...
           ' Ingenieros: Estática, Undécima Edición, McGraw Hill Education.\n\n']);  
  fprintf('Problema 3.47 Ref. [1]\n');
  fprintf('----------------------\n\n');  

  % Datos
  T_AB_mag = 4;

  % cálculo del vector tensión cable AB
  cos_theta = 15/sqrt(15^2+2.5^2);
  sin_theta = 2.5/sqrt(15^2+2.5^2);
  T_AB = [T_AB_mag*sin_theta, -T_AB_mag*cos_theta, 0];

  % cálculo del vector posición punto A
  z = sqrt(25^2-15^2);
  r = [0, 15, z];

  % cálculo del momento M_O
  M_O = cross(r,T_AB);

  % impresión de resultados
  fprintf('T_AB = [%f kN, %f kN, %f kN]\n',T_AB);
  fprintf('r = [%f m, %f m, %f m]\n',r);  
  fprintf('M_O = r x T_AB = cross(r,T_AB) = [%f kN-m, %f kN-m, %f kN-m]\n\n',M_O);
  fprintf('Componentes del momento de T_AB con respecto a los ejes coordenados:\n'); 
  fprintf('M_x = M_O(1) = %f kN-m\n',M_O(1));  
  fprintf('M_y = M_O(2) = %f kN-m\n',M_O(2));   
  fprintf('M_z = M_O(3) = %f kN-m\n\n',M_O(3));     

  % ploteo de vectores
  % vector r
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,r,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector v1 con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view(3);
  % vector T_AB
  x0 = r; % origen del vector
  plotvec3d(x0,T_AB,'LineWidth',1.5,'MaxHeadSize',1.8); % plotea el vector v2 con origen en x0  
  % vector M_O
  x0 = [0,0,0]; % origen del vector  
  plotvec3d(x0,M_O/10,'LineWidth',1.5,'MaxHeadSize',0.6); % plotea el vector v1 con origen en x0
  %
  legend('r (m)','F (kN)','M_O x 10 (kN-m)','Location','eastoutside');     
  title(['M_O = [',num2str(M_O(1)/10),', ',num2str(M_O(2)/10),', ',num2str(M_O(3)/10),'] x 10']);   

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