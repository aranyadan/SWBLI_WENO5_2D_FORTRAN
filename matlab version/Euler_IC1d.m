function [r0,u0,v0,p0,tEnd,cfl] = Euler_IC1d(x,y,~)
fprintf('Setting boundary conditions:\n');

%% Load Selected case Initial condition:
% Pre-Allocate variables
r0 = zeros(size(x)); 
u0 = zeros(size(x)); 
v0 = zeros(size(x));
p0 = zeros(size(x));



% Quadrant 1
a = find(x(:,1) >= 0.5 * x(end,1));
b = find(y(1,:) >= 0.5 * y(1,end));
r0(a,b) = 1.5;
u0(a,b) = 0;
v0(a,b) = 0;
p0(a,b) = 1.5;

% Quadrant 2
a = find(x(:,1)  < 0.5 * x(end,1));
b = find(y(1,:) >= 0.5 * y(1,end));
r0(a,b) = 0.5323;
u0(a,b) = 1.206;
v0(a,b) = 0;
p0(a,b) = 0.3;

% Quadrant 3
a = find(x(:,1)  < 0.5 * x(end,1));
b = find(y(1,:)  < 0.5 * y(1,end));
r0(a,b) = 0.138;
u0(a,b) = 1.206;
v0(a,b) = 1.206;
p0(a,b) = 0.029;

% Quadrant 4
a = find(x(:,1) >= 0.5 * x(end,1));
b = find(y(1,:)  < 0.5 * y(1,end));
r0(a,b) = 0.5323;
u0(a,b) = 0;
v0(a,b) = 1.206;
p0(a,b) = 0.3;

tEnd = 0.3;
cfl = 0.475;

%% Display
% h=surf(x,y,r0);
% set(h,'LineStyle','none');
% view(0,90);