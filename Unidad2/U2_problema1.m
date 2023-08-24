function U2_problema1
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
% Solución: Problema 1.
% Unidad 2: Cuerpos Rígidos. Sistemas Equivalentes de Fuerzas.
%-------------------------------------------------------------------------------

  clc
  close all
  clear all

  %% Problema 3.5 Ref. [1] 

  fprintf('Referencias:\n');
  fprintf(['[1] Beeer, Johnston, Mazurek, Mecánica Vectorial para'...
           ' Ingenieros: Estática, Undécima Edición, McGraw Hill Education.\n\n']);   
  fprintf('Problema 3.5 Ref. [1]\n');
  fprintf('---------------------\n\n');  

  fprintf('Letra a):\n\n');
  % Datos
  F_mag = 300;  
  % cálculo del momento
  r = [-100, -200, 0];
  F = [F_mag*cos(25*pi()/180), F_mag*sin(25*pi()/180), 0];
  M_D = cross(r,F);
  fprintf('r = [%f mm, %f mm, %f mm]\n',r);
  fprintf('F = [%f N, %f N, %f N]\n',F);  
  fprintf('M_D = r x F = cross(r,F) = [%f N-mm, %f N-mm, %f N-mm]\n',M_D);
  fprintf('M_D = r x F = cross(r,F)/1000 = [%f N-m, %f N-m, %f N-m]\n\n',M_D/1000);

  % ploteo de vectores
  % vector r
  figure; % define una nueva figura
  x0 = [100,200,0]; % origen del vector
  plotvec3d(x0,r,'LineWidth',1.5,'MaxHeadSize',0.5); % plotea el vector v1 con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([-25,25]);
  % vector F
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,F,'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector v2 con origen en x0  
  % vector M_D
  x0 = [100,200,0]; % origen del vector  
  plotvec3d(x0,M_D/1000,'LineWidth',1.5,'MaxHeadSize',1.6); % plotea el vector v1 con origen en x0
  %
  legend('r (mm)','F (N)','M_D (N-m)','Location','eastoutside');     
  title(['M_D = [',num2str(M_D(1)/1000),', ',num2str(M_D(2)/1000),', ',num2str(M_D(3)/1000),']']);   

  fprintf('Letra b):\n\n');
  M_D_mag = norm(M_D);
  d = 125;
  Fx = M_D_mag/d;
  fprintf('M_D_mag = %f N\n',M_D_mag);
  fprintf('d = %f mm\n',d);    
  fprintf('Fx = ||M_D||/d = %f N\n\n',Fx);  

  fprintf('Letra c):\n\n');
  M_D_mag = norm(M_D);
  d = sqrt(200^2+125^2);
  % fuerza mínima
  F_mag = M_D_mag/d;
  fprintf('M_D_mag = %f N\n',M_D_mag);
  fprintf('d = sqrt(200^2+125^2) = %f mm\n',d);    
  fprintf('||F|| = ||M_D||/d = %f N\n\n',F_mag);   
  % ángulo
  alpha = atan(125/200);
  theta = pi()/2-alpha;
  fprintf('alpha = atan(125/200) = %f °\n',alpha*180/pi());
  fprintf('theta = pi()/2-alpha = %f °\n\n',theta*180/pi());

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