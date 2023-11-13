function U5_problema2
% ME3130: Mecánica Estática
% Departamento de Ingeniería Mecánica
% Universidad de Chile
%
% Profesor : A. Ortiz Bernardin
% E-mail   : aortizb@uchile.cl
% Web      : https://camlab.cl/alejandro/
%
%-------------------------------------------------------------------------------
% Solución: Problema 2.
% Unidad 5: Fuerzas y Momentos Internos.
%------------------------------------------------------------------------------- 

  clc
  close all
  clear all
  
  % Datos
  a = 2;
  b = 2;
  c = 2;
  P = 50;
  w = 20;
  
  % Reacciones
  Dy = (w*c*(a+b+c/2)+P*a)/(a+b);
  Ay = P+w*c-Dy;
  Ax = 0;
  
  % Puntos de ploteo a lo largo del eje x
  Np = 1000; % número de puntos de ploteo
  x=linspace(0,a+b+c,Np);
  
  % Funciones para graficar: Definir estas funciones al final de este archivo
  V=@(x,a,b,c,P,w,Ay,Dy)diagrama_corte(x,a,b,c,P,w,Ay,Dy);
  M=@(x,a,b,c,P,w,Ay,Dy)diagrama_momento(x,a,b,c,P,w,Ay,Dy);
  
  % Formación de arreglos V(x) y M(x) para posterior ploteo
  Vi = zeros(1,length(x));
  Mi = zeros(1,length(x));
  for i=1:length(x)
    Vi(i) = V(x(i),a,b,c,P,w,Ay,Dy);
    Mi(i) = M(x(i),a,b,c,P,w,Ay,Dy);
  end
  
  %% DARK MODE CONFIGURATION
  config.dark_mode_figures.activate='yes'; % 'yes' or 'no'
  
  if strcmp(config.dark_mode_figures.activate,'yes')
    linecolor="#77AC30";
    config.dark_mode_figures.background_color=[0.254901975393295 0.266666680574417 0.372549027204514]; % cobalt
    config.dark_mode_figures.axes_color=[0.862745106220245 0.862745106220245 0.862745106220245]; % white/grey
    config.dark_mode_figures.colorbar_data_color=[0.862745098039216 0.862745098039216 0.862745098039216]; % white/grey
    config.matlab_colormap='parula';  
  else
    linecolor="#1F8ACE";
  end
  
  %%
  figure;
  plot(x,Vi,'-','Color',linecolor,'LineWidth',2,'MarkerSize',6);
  % axis square
  grid on
  set(gca,'XMinorGrid','on');
  set(gca,'YMinorGrid','on');
  box on
  
  if strcmp(config.dark_mode_figures.activate,'yes')
    set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold',...
        'Color',config.dark_mode_figures.background_color,...
        'XColor',config.dark_mode_figures.axes_color,...
        'YColor',config.dark_mode_figures.axes_color,...
        'ZColor',config.dark_mode_figures.axes_color);  
    xlabel({'x'},'FontWeight','normal','FontSize',16,'FontName',...
           'Times New Roman','Interpreter','latex','Color',config.dark_mode_figures.axes_color);
    ylabel({'V(x)'},'FontWeight','normal','FontSize',16,'FontName',...
           'Times New Roman','Interpreter','latex','Color',config.dark_mode_figures.axes_color);
  else
    xlabel({'x'},'FontSize',16);    
    ylabel({'V(x)'},'FontSize',16);
  end
  
  if strcmp(config.dark_mode_figures.activate,'yes')
  %     set(gcf,'InvertHardcopy','off','PaperType','<custom>','PaperSize',[5.83 4.38],'Color',config.dark_mode_figures.background_color,'Renderer','opengl');
    set(gcf,'InvertHardcopy','off','PaperType','<custom>','PaperSize',[6.5 4.88],'Color',config.dark_mode_figures.background_color,'Renderer','opengl');
  else
  %     set(gcf,'InvertHardcopy','off','PaperType','<custom>','PaperSize',[5.83 4.38],'Color',[1 1 1],'Renderer','opengl');
    set(gcf,'InvertHardcopy','off','PaperType','<custom>','PaperSize',[6.5 4.88],'Color',[1 1 1],'Renderer','opengl');
  end
  
  %%
  figure;
  plot(x,Mi,'-','Color',linecolor,'LineWidth',2,'MarkerSize',6);
  % axis square
  grid on
  set(gca,'XMinorGrid','on');
  set(gca,'YMinorGrid','on');
  box on
  
  if strcmp(config.dark_mode_figures.activate,'yes')
    set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold',...
        'Color',config.dark_mode_figures.background_color,...
        'XColor',config.dark_mode_figures.axes_color,...
        'YColor',config.dark_mode_figures.axes_color,...
        'ZColor',config.dark_mode_figures.axes_color);  
    xlabel({'x'},'FontWeight','normal','FontSize',16,'FontName',...
           'Times New Roman','Interpreter','latex','Color',config.dark_mode_figures.axes_color);
    ylabel({'M(x)'},'FontWeight','normal','FontSize',16,'FontName',...
           'Times New Roman','Interpreter','latex','Color',config.dark_mode_figures.axes_color);
  else
    xlabel({'x'},'FontSize',16);    
    ylabel({'M(x)'},'FontSize',16);
  end
  
  if strcmp(config.dark_mode_figures.activate,'yes')
  %     set(gcf,'InvertHardcopy','off','PaperType','<custom>','PaperSize',[5.83 4.38],'Color',config.dark_mode_figures.background_color,'Renderer','opengl');
    set(gcf,'InvertHardcopy','off','PaperType','<custom>','PaperSize',[6.5 4.88],'Color',config.dark_mode_figures.background_color,'Renderer','opengl');
  else
  %     set(gcf,'InvertHardcopy','off','PaperType','<custom>','PaperSize',[5.83 4.38],'Color',[1 1 1],'Renderer','opengl');
    set(gcf,'InvertHardcopy','off','PaperType','<custom>','PaperSize',[6.5 4.88],'Color',[1 1 1],'Renderer','opengl');
  end

end

%% DEFINICIONES DE FUNCIONES

function V = diagrama_corte(x,a,b,c,P,w,Ay,Dy)

  if x>=0 && x<a
    V = Ay;
  elseif x>=a && x<(a+b)
    V = Ay-P;    
  else
    V = Ay-P-w*(x-(a+b))+Dy;
  end

end

function M = diagrama_momento(x,a,b,c,P,w,Ay,Dy)
  if x>=0 && x<a
    M = Ay*x;
  elseif x>=a && x<(a+b)
    M = Ay*x-P*(x-a);    
  else
    M = Ay*x-P*(x-a) -w*(x-(a+b))*(x-(a+b))/2+Dy*(x-(a+b));
  end  
end
