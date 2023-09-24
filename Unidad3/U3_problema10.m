function U3_problema10
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
  d1 = 9;
  d2 = 3;
  d3 = 2;
  d4 = 1.5;
  W = 450;  
  F = 225;

  %% a) 

  P = (F*d1+W*d4)/(d2+d3);
  Ay = F+W+P;
  fprintf('a) Se necesitará un contrapeso de P = %f kN para evitar el volcamiento.\n',P);
  fprintf('   El valor de Ay en estas condiciones es Ay = %f kN.\n\n',Ay);

  %% b)
  P = 2*P; % se redefine P
  By = (P*(d2+d3)-F*d1-W*d4)/d2;
  Ay = (F*(d1+d2)+W*(d2+d4)-P*d3)/d2;
  fprintf('b) By = %f kN; Ay = %f kN\n',By,Ay);
  fprintf('   Por lo tanto, se observa que By aumenta y Ay disminuye.\n\n');  

  %% c) 
  P = (F*(d1+d2)+W*(d2+d4))/d3;
  fprintf('c) La grúa volcará en el otro sentido cuando el contrapeso\n');
  fprintf('   instalado tenga un peso P >= %f kN.\n\n',P);

  %% e)
  F = 0:25:225; % arreglo [0,25,50,...,200,225]
  P_min_i = zeros(1,length(F)); % pre-asigna memoria para el arreglo P_min_i
  P_max_i = zeros(1,length(F)); % pre-asigna memoria para el arreglo P_max_i
  for i=1:length(F)
    P_min_i(i) = (F(i)*d1+W*d4)/(d2+d3);
    P_max_i(i) = (F(i)*(d1+d2)+W*(d2+d4))/2;
  end

  figure;
  plot(F,P_min_i,'LineStyle','-','Color','b','LineWidth',2,'Marker','o',...
      'MarkerEdgeColor','b','MarkerFaceColor','#BDBDF5','MarkerSize',8);
  hold on
  plot(F,P_max_i,'LineStyle','-','Color','r','LineWidth',2,'Marker','o',...
      'MarkerEdgeColor','r','MarkerFaceColor','#F6B2B2','MarkerSize',8);

  xlabel('Carga a elevar (kN)','FontSize',12);    
  ylabel('P_{mín}, P_{máx} (kN)','FontSize',12);  
  axis square
  grid on
  set(gca,'XMinorGrid','on');
  set(gca,'YMinorGrid','on');

  s1 = 'P_{mín}';
  s2 = 'P_{máx}';
  legend1 = legend(s1,s2,'location','eastoutside');
  set(legend1,'FontSize',10);
  % legend('boxoff')  

  fprintf('e) Cualquier valor entre P = [%f, %f] kN garantizará el equilibrio.\n',max(P_min_i),min(P_max_i));
  fprintf('   Por ejemplo, el promedio P = %f kN.\n\n',mean([max(P_min_i),min(P_max_i)]));

end


