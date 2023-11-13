function U5_problema1
% ME3130: Mecánica Estática
% Departamento de Ingeniería Mecánica
% Universidad de Chile
%
% Profesor : A. Ortiz Bernardin
% E-mail   : aortizb@uchile.cl
% Web      : https://camlab.cl/alejandro/
%
%-------------------------------------------------------------------------------
% Solución: Problema 1.
% Unidad 5: Fuerzas y Momentos Internos.
%------------------------------------------------------------------------------- 
  clc
  close all
  clear all
  
  % Datos
  a = 2;
  b = 2;
  L = a+b;
  P = 50;
  
  % Reacciones
  By = P*a/L;
  Ay = P*b/L;
  Ax = 0;
  
  % Puntos de ploteo a lo largo del eje x
  Np = 1000; % número de puntos de ploteo
  x=linspace(0,L,Np);
  
  % Funciones para graficar: Definir estas funciones al final de este archivo
  V=@(x,P,a,b,L)diagrama_corte(x,P,a,b,L);
  M=@(x,P,a,b,L)diagrama_momento(x,P,a,b,L);
  
  % Formación de arreglos V(x) y M(x) para posterior ploteo
  Vi = zeros(1,length(x));
  Mi = zeros(1,length(x));
  for i=1:length(x)
    Vi(i) = V(x(i),P,a,b,L);
    Mi(i) = M(x(i),P,a,b,L);
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

function V = diagrama_corte(x,P,a,b,L)
  if x>=0 && x<a
    V = P*b/L;   
  else
    V = P*(b/L-1);
  end

end

function M = diagrama_momento(x,P,a,b,L)
  if x>=0 && x<a
    M = P*b/L*x;   
  else
    M = P*b/L*x-P*(x-a);
  end
end
