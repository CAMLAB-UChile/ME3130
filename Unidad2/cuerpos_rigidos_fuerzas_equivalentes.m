function cuerpos_rigidos_fuerzas_equivalentes
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

  %% 1.0 Definición de vectores: 
  %     v1 = v1x i + v1y j + v1z k
  %     v2 = v2x i + v2y j + v3z k  
  %     v3 = v2x i + v2y j + v3z k    
  %
  %     definido como un vector fila:
  %       v1 = [v1x, v1y, v1z] o v1 = [v1x v1y v1z]
  %     o definido como un vector columna:
  %       v1 = [v1x; v1y; v1z] or v1 = [v1x, v1y, v1z]' o v1 = [v1x v1y v1z]'

  v1x = 1; v1y = 0.5  ; v1z = 2.5;
  v2x = 3.0; v2y = 5.5 ; v2z = 1.5;
  v3x = 2.5; v3y = 10 ; v3z = 4.0; 

  v1 = [v1x, v1y, v1z]; 
  v2 = [v2x, v2y, v2z]; 
  v3 = [v3x, v3y, v3z];

  % ploteo de vectores desde el origen
  figure;
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,v1,'LineWidth',1.5,'MaxHeadSize',0.7); % plotea el vector v1 con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([65,30]);
  %
  plotvec3d(x0,v2,'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector v2 con origen en x0 
  %
  plotvec3d(x0,v3,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector v3 con origen en x0    
  legend('v1','v2','v3','Location','eastoutside');

  %% 2.0 Producto vectorial entre dos vectores

  fprintf('Producto vectorial de dos vectores (fórmula del determinante)\n');
  fprintf('----------------------------------------------------------------\n\n');    
  fprintf('v1 = [%f, %f, %f]\n',v1); % impresión como arreglo
  fprintf('v2 = [%f, %f, %f]\n\n',v2); % impresión como arreglo    

  % Ejemplo: v1 x v2
  
  fprintf('          |   i      j      k  | = |   i      j      k   |\n');
  fprintf('v1 x v2 = |  v1x    v1y    v1z | = | v1(1)  v1(2)  v1(3) |\n');
  fprintf('          |  v2x    v2y    v2z | = | v2(1)  v2(2)  v2(3) |\n');
  fprintf('        = (v1(2)*v2(3) - v1(3)*v2(2))i - (v1(1)*v2(3) - v1(3)*v2(1))j + (v1(1)*v2(2) - v1(2)*v2(1))k\n');   
  fprintf('        = cross(v1,v2)\n\n')

  fprintf('v1 x v2 = (v1(2)*v2(3) - v1(3)*v2(2))i - (v1(1)*v2(3) - v1(3)*v2(1))j + (v1(1)*v2(2) - v1(2)*v2(1))k\n');
  fprintf('        = (%f)i - (%f)j + (%f)k\n',v1(2)*v2(3) - v1(3)*v2(2),v1(1)*v2(3) - v1(3)*v2(1),v1(1)*v2(2) - v1(2)*v2(1)) 
  fprintf('v1 x v2 = cross(v1,v2) = [%f, %f, %f]\n\n',cross(v1,v2)); % impresión como arreglo    

  % ploteo del vector desde el origen
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,v1,'LineWidth',1.5,'MaxHeadSize',1.2); % plotea el vector v1 con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([170,25]);
  %
  plotvec3d(x0,v2,'LineWidth',1.5,'MaxHeadSize',0.7); % plotea el vector v2 con origen en x0  
  %
  plotvec3d(x0,cross(v1,v2),'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector v1 con origen en x0
  %
  legend('v1','v2','v1 x v2','Location','eastoutside');
  v1xv2 = cross(v1,v2);
  title(['v1 x v2 = [',num2str(v1xv2(1)),', ',num2str(v1xv2(2)),', ',num2str(v1xv2(3)),']']);    

  %% 3.0 Aplicaciones producto vectorial entre dos vectores

  % EJEMPLO: P x Q  vs  Q x P

  % definición de vectores
  P = [2, 2, 0];
  Q = [-2, 2, 0];  

  % P x Q
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,P,'LineWidth',1.5,'MaxHeadSize',1.2); % plotea el vector P con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([65,30]);
  %
  plotvec3d(x0,Q,'LineWidth',1.5,'MaxHeadSize',0.7); % plotea el vector Q con origen en x0  
  %
  plotvec3d(x0,cross(P,Q),'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector PxQ con origen en x0
  %
  legend('P','Q','P x Q','Location','eastoutside');
  pxq = cross(P,Q);
  title(['P x Q = [',num2str(pxq(1)),', ',num2str(pxq(2)),', ',num2str(pxq(3)),']']);    

  % Q x P
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,P,'LineWidth',1.5,'MaxHeadSize',1.2); % plotea el vector P con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([65,30]);
  %
  plotvec3d(x0,Q,'LineWidth',1.5,'MaxHeadSize',0.7); % plotea el vector Q con origen en x0  
  %
  plotvec3d(x0,cross(Q,P),'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector QxP con origen en x0
  %
  legend('P','Q','Q x P','Location','eastoutside');
  pxq = cross(Q,P);
  title(['Q x P = [',num2str(pxq(1)),', ',num2str(pxq(2)),', ',num2str(pxq(3)),']']);

  % EJEMPLO: área de un paralelogramo

  % define vectores
  P = [2, 0, 0];  
  Q = [0, 2, 0];
  Qp = [1, 2, 0];
  %
  fprintf('Área de un paralelogramo\n');
  fprintf('------------------------\n\n');  
  fprintf('P = [%f, %f, %f]\n',P); % impresión como arreglo
  fprintf('Q = [%f, %f, %f]\n',Q); % impresión como arreglo 
  fprintf('Q'' = [%f, %f, %f]\n\n',Qp); % impresión como arreglo   
  % plotea vectores P y Q
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,P,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector P con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view(2); % vista por defecto en 2D
  axis([-0.2 3 -0.2 2]); % fija los límites de los ejes  
  plotvec3d(x0,Q,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector Q con origen en x0    
  legend('P','Q','Location','eastoutside');
  % colorea el area del paralelogramo formado por P y Q
  x = [0, 2, 2, 0];
  y = [0, 0, 2, 2];
  plt = fill(x,y,'yellow','FaceAlpha',0.2);
  plt.Annotation.LegendInformation.IconDisplayStyle = 'off'; % ignora plt en la leyenda
  %
  Apq = cross(P,Q); % vector área
  areapq = norm(Apq); % norma o magnitud del vector área
  title(['||A|| = ||P x Q|| = ',num2str(areapq)]);
  %
  fprintf('A = P x Q = cross(P,Q) = [%f, %f, %f]\n',cross(P,Q)); % impresión como arreglo  
  fprintf('Área paralelogramo P-Q = norm(A) = %f\n\n',norm(cross(P,Q))); % impresión como arreglo    

  % plotea vectores P y Q'
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,P,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector P con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view(2); % vista por defecto en 2D
  axis([-0.2 3 -0.2 2]); % fija los límites de los ejes   
  plotvec3d(x0,Qp,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector Qp con origen en x0    
  legend('P','Q''','Location','eastoutside');
  % colorea el area del paralelogramo formado por P y Q'
  x = [0, 2, 3, 1];
  y = [0, 0, 2, 2];
  plt = fill(x,y,'green','FaceAlpha',0.2);
  plt.Annotation.LegendInformation.IconDisplayStyle = 'off'; % ignora plt en la leyenda
  %
  Apqp = cross(P,Qp); % vector área
  areapqp = norm(Apqp); % norma o magnitud del vector área
  title(['||A|| = ||P x Q''|| = ',num2str(areapqp)]);
  %
  fprintf('A = P x Q'' = cross(P,Q'') = [%f, %f, %f]\n',cross(P,Qp)); % impresión como arreglo  
  fprintf('Área paralelogramo P-Q'' = norm(A) = %f\n\n',norm(cross(P,Qp))); % impresión como arreglo   

  %% 4.0 Producto escalar de dos vectores

  fprintf('Producto escalar de dos vectores\n');
  fprintf('--------------------------------\n\n');    

  fprintf('v1 = [%f, %f, %f]\n',v1); % impresión como arreglo
  fprintf('v2 = [%f, %f, %f]\n',v2); % impresión como arreglo  
  fprintf('v1*v2 = v1(1)*v2(1) + v1(2)*v2(2) + v1(3)*v2(3) = %f\n',v1(1)*v2(1)+v1(2)*v2(2)+v1(3)*v2(3)); % cálculo componente por componente
  fprintf('v1*v2 = dot(v1,v2) = %f\n',dot(v1,v2)); % cálculo mediante función producto punto  
  fprintf('||v1|| =  norm(v1) = %f\n',norm(v1)); 
  fprintf('||v2|| =  norm(v2) = %f\n',norm(v2));   
  fprintf('theta =  acos(v1*v2/(||v1|| ||v2||)) = %f°\n\n',acos(dot(v1,v2)/(norm(v1)*norm(v2)))*180/pi);

  %% 5.0 Triple producto mixto de tres vectores
  fprintf('Triple producto mixto de tres vectores\n');
  fprintf('--------------------------------------\n\n');    
  fprintf('v1 = [%f, %f, %f]\n',v1); % impresión como arreglo
  fprintf('v2 = [%f, %f, %f]\n',v2); % impresión como arreglo     
  fprintf('v3 = [%f, %f, %f]\n\n',v3); % impresión como arreglo   

  fprintf('               |  v1x    v1y    v1z | = | v1(1)  v1(2)  v1(3) |\n');
  fprintf('v1*(v2 x v3) = |  v2x    v2y    v2z | = | v2(1)  v2(2)  v2(3) |\n');
  fprintf('               |  v3x    v3y    v3z | = | v3(1)  v3(2)  v3(3) |\n');
  fprintf('             = (v2(2)*v3(3) - v2(3)*v3(2))*v1(1)\n'); 
  fprintf('               - (v2(1)*v3(3) - v2(3)*v3(1))*v1(2)\n'); 
  fprintf('               + (v2(1)*v3(2) - v2(2)*v3(1))*v1(3) = %f\n',...
         (v2(2)*v3(3) - v2(3)*v3(2))*v1(1) - (v2(1)*v3(3) - v2(3)*v3(1))*v1(2)...
         + (v2(1)*v3(2) - v2(2)*v3(1))*v1(3));
  fprintf('v1*(v2 x v3) =  det([v1; v2; v3]) = %f\n',...
                           det([v1; v2; v3])); 
  fprintf('v1*(v2 x v3) =  dot(v1,cross(v2,v3)) = %f\n\n',...
                           dot(v1,cross(v2,v3)));   

  %% 5.0 Aplicaciones triple producto mixto de tres vectores  

  % EJEMPLO: Volumen de un paralelepipedo
  fprintf('Volumen de un paralelepipedo\n');
  fprintf('----------------------------\n\n');  

  % define vectores
  S = [0, -3, 4];
  P = [-3, 0, 0];  
  Q = [0, -3, 0];  

  fprintf('S = [%f, %f, %f]\n',S); % impresión como arreglo
  fprintf('P = [%f, %f, %f]\n',P); % impresión como arreglo    
  fprintf('Q = [%f, %f, %f]\n',Q); % impresión como arreglo  

  figure; % define una nueva figura
  x0 = [3,3,0]; % origen del vector
  plotvec3d(x0,S,'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector S con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([120,20]);
  plotvec3d(x0,P,'LineWidth',1.5,'MaxHeadSize',0.4); % plotea el vector P con origen en x0  
  plotvec3d(x0,Q,'LineWidth',1.5,'MaxHeadSize',0.4); % plotea el vector Q con origen en x0
  legend('S','P','Q','Location','eastoutside');  
  fprintf('Vol = abs(S*(P x Q)) =  abs(dot(S,cross(P,Q))) = %f\n\n',...
                           abs(dot(S,cross(P,Q))));    

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


