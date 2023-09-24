function U3_problema12
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

  %% datos
  w = 500;
  L1 = 3; % tramo viga AB
  L2 = 3; % tramo viga AB
  L3 = 3; % tramo viga AB
  beta = 30; % ángulo inclinación barra BC

  %% carga distribuida
  W_mag = w*L2/2;
  a = L2/3; % posición de W con respecto al extremo izquierdo de la carga distribuida

  %% cálculos a partir del diagrama de cuerpo libre de la viga AB
  d1 = 4; % distancia desde punto A a punto de aplicación de W
  d2 = 5; % distancia desde punto de aplicación de W a punto B
  h = d2*tan(beta*pi/180); % distancia perpendicular desde viga AB al punto de 
                           % concurrencia de las 3 fuerzas
  alpha = atan(h/d1)*180/pi; % ángulo de inclinación reacción en punto A

  %% cálculo de RA y FB por método gráfico
  FB_mag = W_mag*sin((180-90-alpha)*pi/180)/sin((beta+alpha)*pi/180);
  RA_mag = FB_mag*cos(beta*pi/180)/sin((180-90-alpha)*pi/180);

  %% ploteo del polígono de fuerzas

  % definición de vectores
  RA = [RA_mag*cos(alpha*pi/180), RA_mag*sin(alpha*pi/180), 0]; % vector RA
  FB = [-FB_mag*cos(beta*pi/180), FB_mag*sin(beta*pi/180), 0]; % vector RA  
  W = [0, -W_mag, 0]; % vector W

  % ploteo de vectores
  figure;
  x0 = [0,0,0]; % origen del vector
  plotvec3d(x0,W,'LineWidth',1.5,'MaxHeadSize',0.17); % plotea vector W
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view(2); % vista 2D por defecto
  %
  x0 = W;
  plotvec3d(x0,FB,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea vector FB
  %
  x0 = W+FB;
  plotvec3d(x0,RA,'LineWidth',1.5,'MaxHeadSize',0.2); % plotea vector RA
  legend('W','FB','RA','Location','eastoutside');

  % ploteo del DCL de la viga AB
  figure;
  scal = 2/max([norm(RA),norm(FB),norm(W)]); % parámetro de escalamiento
  x0 = -scal*RA; % origen del vector
  x0 = [x0(1), x0(2)+d1*0.1/2, x0(3)];
  plotvec3d(x0,scal*RA,'LineWidth',1.5,'MaxHeadSize',0.7); % plotea vector RA
  axis('off');
  hold on; % mantiene la figura para seguir ploteando sobre ella
  view(2); % vista 2D por defecto 
  %
  x0 = [d1,scal*W_mag+d1*0.1,0];
  plotvec3d(x0,scal*W,'LineWidth',1.5,'MaxHeadSize',0.55); % plotea vector W
  %
  x0 = [d1+d2,d1*0.1/2,0];
  plotvec3d(x0,scal*FB,'LineWidth',1.5,'MaxHeadSize',0.7); % plotea vector FB  
  legend('RA','W','FB','Location','eastoutside');  
  title('DCL');
  ax = gca;
  ax.TitleHorizontalAlignment = 'left';
  %
  x = [0,d1+d2,d1+d2,0,0];
  y = [0,0,d1*0.1,d1*0.1,0];
  plt = plot(x,y,'LineWidth',1,'Color','k');
  plt.Annotation.LegendInformation.IconDisplayStyle = 'off'; % ignora plt en la leyenda

  % colorea el area del rectángulo formado por los arreglos x e y
  plt2 = fill(x,y,'k','FaceAlpha',0.1);
  plt2.Annotation.LegendInformation.IconDisplayStyle = 'off'; % ignora plt2 en la leyenda

  % impresión de resultados
  fprintf('FB = [%f, %f, %f] lbf.\n',FB);  
  fprintf('||FB|| = norm(FB) = %f lbf.\n',norm(FB));   
  fprintf('RA = [%f, %f, %f] lbf.\n',RA);  
  fprintf('||RA|| = norm(RA) = %f lbf.\n',norm(RA));
  
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


