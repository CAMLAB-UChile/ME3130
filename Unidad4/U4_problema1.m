function U4_problema1
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
% Método: Solución matricial mediante método de elemento finito
% Unidad 4: Análisis Estructural.
%-------------------------------------------------------------------------------  

  clc;       % clear command window
  close all; % close all figures
  
  %
  %% Input data
  %
  
  % mesh
  coord = [0 0 0; 6 5 0; 10 0 0; 14 5 0; 20 0 0]; % nodal coordinates (Cartesian system: x y z)
  numnod = size(coord,1); % number of nodes
  nel = 2; % nodes per element 
  ndof = 3; % number of degrees of freedom per node (spatial truss)

  % connectivity
  connect = [1 2; 1 3; 2 3; 2 4; 3 4; 3 5; 4 5]; % nodal connectivity
  numele = size(connect,1); % number of elements

  % element properties
  As = [1; 1; 1; 1; 1; 1; 1]; % cross-sectional area
  Ey = [1e7; 1e7; 1e7; 1e7; 1e7; 1e7; 1e7]; % Young's modulus

  % essential boundary conditions
  ebcdof = [1 2 3 6 9 12 14 15]; % degrees of freedom (in 3D format - z dof must be constrained for 2D problems) that are constrained
  ebcval = [0 0 0 0 0 0 0 0]; % prescribed value corresponding to the degree of freedom
                    % specified in ebcdof

  % natural boundary conditions
  nbcdof = [2 8];
  nbcval = [-4905 -4905];

  %
  %% initialize stiffness matrix [K] and external force vector {f}
  %
  
  bigk = zeros(ndof*numnod,ndof*numnod); % global stiffness matrix (initialized to zero) for [K]
  fext = zeros(ndof*numnod,1);      % global force vector (initialized to zero) for {f}
  
  %
  %% assemble element matrices into global ones (loop over elements)
  %
  
  for e = 1:numele
    ke = elemstiff(e,nel,coord,connect,Ey,As); % element stiffness matrix
    sctr = connect(e,:);
    sctr2=[3*sctr(1)-2,3*sctr(1)-1,3*sctr(1),3*sctr(2)-2,3*sctr(2)-1,3*sctr(2)];
    bigk(sctr2,sctr2) = bigk(sctr2,sctr2) + ke;
  end

  %
  %% apply traction (Neumann) boundary condition in the force vector
  %
  
  fext(nbcdof) = fext(nbcdof) + nbcval';
  
  %
  %% impose essential (Dirichlet) boundary conditions
  %

  bigk_pre = bigk; % to compute internal forces at truss nodes and reactions
  
  for i = 1:length(ebcdof)
    n = ebcdof(i);
    for j = 1:2*numnod
      if (isempty(find(ebcdof == j))) % dof j is not found in ebcdof vector
        fext(j) = fext(j) - bigk(j,n)*ebcval(i);
      end
    end
    bigk(n,:) = 0.0;
    bigk(:,n) = 0.0;
    bigk(n,n) = 1.0;
    fext(n) = ebcval(i);
  end
  
  %
  %% solve for nodal unknowns
  %
  
  nodal_disp = bigk\fext; % nodal displacement solution
  nodal_disp

  %
  %% compute nodal forces
  %

  nodal_forces = bigk_pre*nodal_disp;
  nodal_forces

  %
  %% Postprocess the internal forces
  %

  eax = zeros(numele,1);
  sax = zeros(numele,1);
  Pax = zeros(numele,1);
  for e = 1:numele  
    [eax_e,sax_e,Pax_e] = internalforces(e,nel,coord,connect,Ey,As,nodal_disp);
    eax(e) = eax_e;
    sax(e) = sax_e;
    Pax(e) = Pax_e;
  end

  eax
  sax
  Pax
end

function [ke] = elemstiff(e,nel,coord,connect,Ey,As)
  nodes = connect(e,:); % [node1 node2]
  xe = coord(nodes,:); % coordinate of nodes [x1 y1 z1; x2 y2 z2]
  Le = norm(xe(nel,:)-xe(1,:)); % element length
  M = (xe(nel,1)-xe(1,1))/Le; % direction cosine
  N = (xe(nel,2)-xe(1,2))/Le; % direction cosine
  L = (xe(nel,3)-xe(1,3))/Le; % direction cosine
  % stifness matrix
  ke = Ey(e)*As(e)/Le*[M*M, M*N, M*L, -M*M, -M*N, -M*L;...
                       M*N, N*N, N*L, -M*N, -N*N, -N*L;...
                       M*L, N*L, L*L, -M*L, -N*L, -L*L;...
                       -M*M, -M*N, -M*L, M*M, M*N, M*L;...
                       -M*N, -N*N, -N*L, M*N, N*N, N*L;...
                       -M*L, -N*L, -L*L, M*L, N*L, L*L];
end

function [eax_e,sax_e,Pax_e] = internalforces(e,nel,coord,connect,Ey,As,dof)  
  nodes = connect(e,:); % [node1 node2]
  xe = coord(nodes,:); % coordinate of nodes [x1 y1 z1; x2 y2 z2]
  Le = norm(xe(nel,:)-xe(1,:)); % element length
  M = (xe(nel,1)-xe(1,1))/Le; % direction cosine
  N = (xe(nel,2)-xe(1,2))/Le; % direction cosine
  L = (xe(nel,3)-xe(1,3))/Le; % direction cosine
  Be = 1/Le*[-M -N -L M N L];
  ind = [3*nodes(1)-2,3*nodes(1)-1,3*nodes(1),3*nodes(2)-2,3*nodes(2)-1,3*nodes(2)];
  eax_e = Be*dof(ind);
  sax_e = Ey(e)*eax_e;
  Pax_e = sax_e*As(e);
end


