function rossler

% 3-variable Rossler model - chaos
% Didier Gonze
% 8/7/2008

clc;

%%%% Number of variable and initial conditions:

nbvar=3; 
xini=ones(1,nbvar)/10;

%%%% Time parameters:

trans=100;
tend=500;
tstep=0.01;

%%%% Range (for bifurcation diagram as a function of b):

b=0.2;   % (default value for chaos) 

bmin=0.1;
bmax=2;
bint=0.05;

brange=[bmin bint bmax];



%%%% Task:

%integration(xini,trans,tend,tstep,b);
bifurcation(xini,trans,tend,tstep,brange);



%====================================================================
% Integration
%====================================================================

function output=integration(x0,trans,tend,tstep,b)

[t,x] = run(x0,trans,tend,tstep,b);


set(figure(1),'Position', [400 400 500 300]);  
clf;

plot(t,x(:,1:3));           
xlabel('Time','fontsize',18);
ylabel('Variables','fontsize',18);
xlim([0 tend]);
legend('X','Y','Z');


set(figure(2),'Position', [400 400 500 300]);  
clf;

plot3(x(:,1),x(:,2),x(:,3));
xlabel('X','fontsize',18);
ylabel('Y','fontsize',18);
zlabel('Z','fontsize',18);
box on;



%====================================================================
% Bifurcation
%====================================================================

function output=bifurcation(x0,trans,tend,tstep,range);

D=[];  % data (bifurcation diagram)

for b=range(1):range(2):range(3)

    fprintf('b=%g...\n',b);

    [t,x] = run(x0,trans,tend,tstep,b);
    
    for i=2:length(x(:,2))-1
        if((x(i,2)>x(i-1,2))&&(x(i,2)>x(i+1,2)))
            D=[D; b x(i,2)];
        end
    end
    
end

figure(3)
plot(D(:,1),D(:,2),'ro','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',1.5)

xlabel('b','fontsize',18);
ylabel('max(X)','fontsize',18);


% ===================================================================
% Run
% ===================================================================

function [t,x]=run(x0,trans,tend,tstep,b)

ttrans = [0:tstep:trans];
tspan = [0:tstep:tend];

option = [];
%option = odeset('RelTol', 1e-5);
%option=odeset('OutputS',[1:3],'OutputF','odeplot');

if trans > 0 
    [t x] = ode45(@dxdt,ttrans,x0,option,b);
    x0=x(end,:);
end

[t x] = ode45(@dxdt,tspan,x0,option,b);



% ===================================================================
% dxdt
% ===================================================================

function y = dxdt(t,x,b)

%%% parameters

a=0.2;
%b=0.2;
c=5.7;

%%% equations

y = [
     -x(2)-x(3);            % dx/dt
     x(1)+a*x(2);           % dy/dt
     b+x(3)*(x(1)-c);       % dz/dt
] ; 
