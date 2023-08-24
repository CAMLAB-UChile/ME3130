function estatica_de_particulas
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
  plotvec3d(x0,v1,'LineWidth',1.5,'MaxHeadSize',0.4); % plotea el vector v1 con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([65,30]);
  %
  plotvec3d(x0,v2,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector v2 con origen en x0 
  %
  plotvec3d(x0,v3,'LineWidth',1.5,'MaxHeadSize',0.1); % plotea el vector v3 con origen en x0    
  legend('v1','v2','v3','Location','eastoutside');

  %% 2.0 Adición de vectores

  fprintf('Adición de vectores\n');
  fprintf('-------------------\n\n');  

  %-- Ejemplo 2.1 --------------------------------------------------------------

  % dos maneras de definir una misma suma
  a1 = v1 + v2; % suma de arreglos
  a2 = [v1x+v2x, v1y+v2y, v1z+v2z]; % suma componente a componente

  fprintf('Suma:\n\n'); 

  % impresión como arreglo
  fprintf('v1 = [%f, %f, %f]\n',v1);
  fprintf('v2 = [%f, %f, %f]\n\n',v2);  
  fprintf('a1 = v1 + v2 = [%f, %f, %f]\n', a1);
  fprintf('a2 = [v1x+v2x, v1y+v2y, v1z+v2z] = [%f, %f, %f]\n\n', a2);  

  % impresión componente a componente
  fprintf('a1 = v1 + v2 = [%f, %f, %f]\n', a1(1), a1(2), a1(3));
  fprintf('a2 = [v1x+v2x, v1y+v2y, v1z+v2z] = [%f, %f, %f]\n\n', a2(1), a2(2), a2(3));

  % ploteo de la suma de vectores: a1 = v1 + v2
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,v1,'LineWidth',1.5,'MaxHeadSize',0.4); % plotea el vector v1 con origen en x0  
  hold on;
  view([65,30]);  
  %
  x0 = v1; % define el origen donde termina v1
  plotvec3d(x0,v2,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector v2 comenzando desde la punta de v1  
  %
  x0 = [0,0,0]; % define el origen en [0,0,0]
  plotvec3d(x0,a1,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector a1 = v1 + v2 con origen eb x0  
  legend('v1','v2','v1 + v2','Location','eastoutside');  

  %-- Ejemplo 2.2 --------------------------------------------------------------

  % dos maneras de definir una misma resta  
  s1 = v1 - v3; % resta de arreglos
  s2 = [v1x-v3x, v1y-v3y, v1z-v3z]; % resta componente a componente

  fprintf('Resta:\n\n');   

  % impresión como arreglo
  fprintf('v1 = [%f, %f, %f]\n',v1);
  fprintf('v3 = [%f, %f, %f]\n\n',v2);   
  fprintf('s1 = v1 - v3 = [%f, %f, %f]\n',s1);
  fprintf('s2 = [v1x-v3x, v1y-v3y, v1z-v3z] = [%f, %f, %f]\n\n',s2);    

  % impresión componente a componente
  fprintf('s1 = v1 - v3 = [%f, %f, %f]\n', s1(1), s1(2), s1(3));
  fprintf('s2 = [v1x-v3x, v1y-v3y, v1z-v3z] = [%f, %f, %f]\n\n', s2(1), s2(2), s2(3));

  % ploteo de la suma de vectores: s1 = v1 - v3
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,v1,'LineWidth',1.5,'MaxHeadSize',0.5); % plotea el vector v1 con origen en x0  
  hold on;
  view([65,30]);  
  %
  x0 = v1; % define el origen donde termina v1
  plotvec3d(x0,-v3,'LineWidth',1.5,'MaxHeadSize',0.1); % plotea el vector -v3 comenzando desde la punta de v1  
  %
  x0 = [0,0,0]; % define el origen en [0,0,0]
  plotvec3d(x0,s1,'LineWidth',1.5,'MaxHeadSize',0.1); % plotea el vector s1 = v1 - v3 con origen en x0  
  legend('v1','-v3','v1 - v3','Location','eastoutside');  

  %% 3.0 Descomposición de vectores 2D
  
  fprintf('Descomposición de vectores 2D\n');
  fprintf('-----------------------------\n\n');    

  %-- Ejemplo 3.1

  % definición de un vector 2D
  d1 = [700,1500,0]; % también puede ser: d1 = [700 1500 0];

  % ploteo del vector d1
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,d1,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector d1 desde el origen
  view(2); % vista frontal por defecto para caso 2D

  % descomposición del vector en el eje x e y
  d1x = d1(1); % componente x del vector d1
  d1y = d1(2); % componente y del vector d1
  d1z = d1(3); % componente z del vector d1

  % ploteo de las componentes
  hold on; % mantiene la figura para seguir ploteando sobre ella
  plotvec3d(x0,[d1x 0 0],'LineWidth',1.5,'MaxHeadSize',0.4); % plotea el vector d1 desde el origen  
  plotvec3d(x0,[0 d1y 0],'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector d1 desde el origen   
  axis([-100 800 -100 1600]); % fija los límites de los ejes
  xticks(0:100:700); % especifica ciertos valores en el eje x
  %xticks([0,100,200,300,400,500,600,700,800]); % especifica ciertos valores en el eje x
  yticks([0,250,500,750,1000,1250,1500]); % especifica ciertos valores en el eje y
  legend('d1','d1x','d1y','Location','eastoutside'); 

  % ángulo entre vector d1 y eje x
  fprintf('Ángulo entre vector d1 y eje x:\n\n');   
  alpha_x = atan(d1y/d1x);
  fprintf('alpha_x = atan(d1y/d1x)*180/pi() = %f°\n\n', alpha_x*180/pi());

  % magnitud del vector d1
  fprintf('Magnitud del vector d1:\n\n');     
  d1_mag = d1x/cos(alpha_x);
  fprintf('d1_mag = d1x/cos(alpha_x) = %f\n\n', d1_mag);

  %% 4.0 Norma de un vector

  %-- Ejemplo 4.1  

  fprintf('Norma de un vector\n');
  fprintf('------------------\n\n');    

  fprintf('v1 = [%f, %f, %f]\n',v1); % impresión como arreglo
  fprintf('||v1|| = sqrt(v1(1)^2 + v1(2)^2 + v1(3)^2) = %f\n',sqrt(v1(1)^2+v1(2)^2+v1(3)^2));
  fprintf('||v1|| =  norm(v1) = %f\n\n',norm(v1));  

  % ploteo del vector desde el origen
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,v1,'LineWidth',1.5,'MaxHeadSize',0.5); % plotea el vector v1 con origen en x0
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([65,30]);  
  legend('v1','Location','eastoutside'); 
  title('||v1|| =',norm(v1)); 

  %% 5.0 Vector unitario
  fprintf('Vector unitario\n');
  fprintf('---------------\n\n');    

  %-- Ejemplo 5.1  

  fprintf('v1 = [%f, %f, %f]\n\n',v1); % impresión como arreglo
  fprintf('Norma del vector v1:\n');  
  fprintf('||v1|| = sqrt(v1(1)^2 + v1(2)^2 + v1(3)^2) = norm(v1) = %f\n\n',norm(v1));
  fprintf('Vector unitario u:\n');   
  u = v1/norm(v1); % vector unitario
  fprintf('u =  v1/||v1|| = [%f, %f, %f]\n\n',u); % impresión vector unitario como arreglo
  fprintf('Norma del vector unitario:\n');  
  fprintf('||u|| = sqrt(u(1)^2 + u(2)^2 + u(3)^2) = norm(u) = %f\n\n',norm(u));
  fprintf('Reconstrucción de v1 a partir del vector unitario u:\n');
  fprintf('v1 = ||v1||u = [%f, %f, %f]\n\n',norm(v1)*u); % impresión como arreglo  

  % ploteo del vector v1 desde el origen
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,v1,'LineWidth',1.5,'MaxHeadSize',0.5); % plotea el vector v1 con origen en x0  
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([65,30]);  

  % ploteo del vector unitario desde el origen
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,u,'LineWidth',1.5,'MaxHeadSize',1.5); % plotea el vector v1 con origen en x0  
  legend('v1','u','Location','eastoutside');  
  title(['||v1|| =',num2str(norm(v1)),', ||u|| =',num2str(norm(u))]);

  %% 6.0 Descomposición de vectores 3D
  
  fprintf('Descomposición de vectores 3D\n');
  fprintf('-----------------------------\n\n');    

  %-- Ejemplo 6.1

  % definición magnitud o norma del vector fuerza
  F_mag = 2500; % dado un vector F, su magnitud es F_mag = norm(F)
  fprintf('F_mag = ||F|| = %f\n',F_mag);    

  % definición del vector unitario a lo largo de la dirección de F_mag
  dx = -40; dy = 80; dz = 30; % componentes del vector distancia AB
  AB = [dx,dy,dz]; % vector distancia desde A hasta B
  u = AB/norm(AB); % vector unitario en la dirección del vector AB
  fprintf('AB = [dx,dy,dz] = [%f, %f, %f]\n\n',AB);  
  fprintf('u = AB/||AB|| = [%f, %f, %f]\n\n',u);  
  % construcción del vector F a partir del vector unitario u
  F = F_mag*u;
  fprintf('F = ||F||u = [%f, %f, %f]\n\n',F);

  % ploteo del vector F
  figure; % define una nueva figura
  x0 = [40,0,-30]; % origen del vector es el origen del vector AB
  plotvec3d(x0,F,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector d1 desde el origen
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view([170,-50]);  

  % ploteo de las componentes de F
  plotvec3d(x0,[F(1),0,0],'LineWidth',1.5,'MaxHeadSize',0.2); % componente x
  plotvec3d(x0,[0,F(2),0],'LineWidth',1.5,'MaxHeadSize',0.2); % componente y  
  plotvec3d(x0,[0,0,F(3)],'LineWidth',1.5,'MaxHeadSize',0.2); % componente z
  legend('F','Fx','Fy','Fz','Location','eastoutside');
  title('||F|| =',norm(F));   

  % dirección de la fuerza
  fprintf('Cosenos directores:\n');    
  costx = F(1)/norm(F); costy = F(2)/norm(F); costz = F(3)/norm(F);
  tx = acos(costx); ty = acos(costy); tz = acos(costz);
  fprintf('cos(tx) = Fx/||F|| = %f\n',costx);  
  fprintf('cos(ty) = Fy/||F|| = %f\n',costy);
  fprintf('cos(tz) = Fz/||F|| = %f\n\n',costz); 
  fprintf('Ángulos:\n');
  fprintf('tx = acos(costx)*180/pi() = %f°\n',tx*180/pi());  
  fprintf('ty = acos(costy)*180/pi() = %f°\n',ty*180/pi());
  fprintf('tz = acos(costz)*180/pi() = %f°\n\n',tz*180/pi());   

  %% 7.0 Propiedades de los cosenos directores

  %-- Ejemplo 7.1

  fprintf('Propiedades de los cosenos directores\n');
  fprintf('-------------------------------------\n\n');  
  fprintf('Reconstrucción del vector unitario:\n');
  fprintf('u = cos(tx)i + cos(ty)j + cos(tz)k\n'); 
  fprintf('  = [costx, costy, costz]\n');  
  fprintf('  = [%f, %f, %f]\n\n',costx,costy,costz);
  fprintf('Relación entre cosenos directores:\n');
  fprintf('cos(tx)^2 + cos(ty)^2 + cos(tz)^2 = %f\n\n',...
          costx^2 + costy^2 + costz^2);

  %% 8.0 Equilibrio en el plano

  fprintf('Equilibrio en el plano\n');
  fprintf('----------------------\n\n');      

  %-- Ejemplo 8.1   
  % Datos:
  W = 1200; % peso soportado
  alpha = 20*pi()/180; % ángulo en radianes
  beta = 5*pi()/180; % ángulo en radianes
  fprintf('Datos:\n'); 
  fprintf('W = %f lbf\n',W);   
  fprintf('alpha = %f rad\n',alpha);  
  fprintf('beta = %f rad\n\n',beta);  
  fprintf('Sumatoria de fuerzas en eje horizontal = 0:\n'); 
  fprintf('F*cos(alpha) - P*sin(beta) = 0\n');   
  fprintf('--> F = P*sin(beta)/cos(alpha)\n\n');   
  fprintf('Sumatoria de fuerzas en eje vertical = 0:\n');  
  fprintf('-F*sin(alpha) + P*cos(beta) - W = 0\n'); 
  fprintf('--> -P*sin(beta)/cos(alpha)*sin(alpha) + P*cos(beta) - W = 0\n');   
  fprintf('--> -P*sin(beta)*tan(alpha) + P*cos(beta) - W = 0\n');   
  fprintf('-->  P*(cos(beta) - sin(beta)*tan(alpha)) - W = 0\n\n');  
  fprintf('Solución:\n');   
  P = W/(cos(beta) - sin(beta)*tan(alpha));
  fprintf('P = W/(cos(beta) - sin(beta)*tan(alpha)) = %f lbf\n',P); 
  fprintf('-->  F = P*sin(beta)/cos(alpha) = %f lbf\n\n',P*sin(beta)/cos(alpha));   

  %-- Ejemplo 8.2  
  F1_mag = 500;
  F1x = F1_mag*24/25;
  F1y = F1_mag*7/25;
  F2_mag = 200;
  F2x = F2_mag*4/5;
  F2y = -F2_mag*3/5;
  F3_mag = 365;
  F3x = -F3_mag*960/1460;
  F3y = -F3_mag*1100/1460;

  fprintf('Datos:\n'); 
  fprintf('||F1|| = %f lbf\n',F1_mag);   
  fprintf('||F2|| = %f lbf\n',F2_mag);   
  fprintf('||F3|| = %f lbf\n',F3_mag);   

  % ploteo de la suma de vectores: F1 + F2 + F3
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,[F1x,F1y,0],'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector [F1x,F1y,0] con origen en x0  
  hold on;
  view(2); % vista frontal por defecto para caso 2D  
  %
  x0 = [F1x,F1y,0]; % define el origen donde termina [F1x,F1y,0]
  plotvec3d(x0,[F2x,F2y,0],'LineWidth',1.5,'MaxHeadSize',0.5); % plotea el vector [F2x,F2y,0] comenzando desde la punta de [F1x,F1y,0]  
  %
  x0 = [F1x,F1y,0]+[F2x,F2y,0]; % define el origen donde termina [F1x,F1y,0]+[F2x,F2y,0]
  plotvec3d(x0,[F3x,F3y,0],'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector [F3x,F3y,0] comenzando desde la punta de [F1x,F1y,0]+[F2x,F2y,0] 
  legend('F1','F2','F3','Location','eastoutside');   
  %
  x0 = [0,0,0]; % define el origen en [0,0,0]
  F_result = [F1x,F1y,0]+[F2x,F2y,0]+[F3x,F3y,0];
  F_result_x = F_result(1);
  F_result_y = F_result(2);
  plotvec3d(x0,F_result,'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector F_result
  legend('F1','F2','F3','F\_result = F1+F2+F3','Location','eastoutside');    
  title('||F\_result|| =',norm(F_result)); 

  fprintf('Magnitud resultante: ||F_result|| = %f lbf\n',norm(F_result));  
  fprintf('Ángulo resultante: alpha = %f°\n\n',atan(F_result_y/F_result_x)*180/pi());    
  %
  Rx = -F_result_x;
  Ry = -F_result_y;  
  fprintf('Reacciones equilibrantes sobre el poste:\n');  
  fprintf('Rx = %f lbf\n',Rx); 
  fprintf('Ry = %f lbf\n',Ry);  

  % plotea suma de vectores en equilibrio: F1 + F2 + F3 - F_result
  figure; % define una nueva figura
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,[F1x,F1y,0],'LineWidth',1.5,'MaxHeadSize',0.2); % plotea el vector [F1x,F1y,0] con origen en x0  
  hold on;
  view(2); % vista frontal por defecto para caso 2D  
  %
  x0 = [F1x,F1y,0]; % define el origen donde termina [F1x,F1y,0]
  plotvec3d(x0,[F2x,F2y,0],'LineWidth',1.5,'MaxHeadSize',0.5); % plotea el vector [F2x,F2y,0] comenzando desde la punta de [F1x,F1y,0]  
  %
  x0 = [F1x,F1y,0]+[F2x,F2y,0]; % define el origen donde termina [F1x,F1y,0]+[F2x,F2y,0]
  plotvec3d(x0,[F3x,F3y,0],'LineWidth',1.5,'MaxHeadSize',0.3); % plotea el vector [F3x,F3y,0] comenzando desde la punta de [F1x,F1y,0]+[F2x,F2y,0] 
  legend('F1','F2','F3','Location','eastoutside');   
  %
  x0 = [F1x,F1y,0]+[F2x,F2y,0]+[F3x,F3y,0]; % define el origen donde termina [F1x,F1y,0]+[F2x,F2y,0]+[F3x,F3y,0]
  plotvec3d(x0,[Rx,0,0],'LineWidth',1.5,'MaxHeadSize',0.3); % plotea compomente Rx del vector reacción
  x0 = [F1x,F1y,0]+[F2x,F2y,0]+[F3x,F3y,0]+[Rx,0,0]; % define el origen donde termina [F1x,F1y,0]+[F2x,F2y,0]+[Rx,0,0]
  plotvec3d(x0,[0,Ry,0],'LineWidth',1.5,'MaxHeadSize',0.3); % plotea compomente Ry del vector reacción  
  legend('F1','F2','F3','Rx','Ry','Location','eastoutside');

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


