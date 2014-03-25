%% generate sigmoid plot to show qPCR prinicples

%% 
x = 0:0.1:30; % number of cycles
a1 = 0.8;
c1 = 12;

a2 = 0.8;
c2 = 15;

a3 = 0.8;
c3 = 18;

a4 = 0.8;
c4 = 20;

noise = 0.005.*randn(1,301);

y1 = 1./(1 + (exp((-1*a1)*(x-c1))))+noise;
y2 = 1./(1 + (exp((-1*a2)*(x-c2))))+noise;

y3 = 1./(1 + (exp((-1*a3)*(x-c3))))+noise;
y4 = 1./(1 + (exp((-1*a4)*(x-c4))))+noise;

y = y1+y2;

plot(x,y1,'k',x,y2,'k--',x,y3,'r',x,y4,'r--')
ylim([0 1.1])

xlabel('PCR Cycle #')
ylabel('Fluorescence')

line([0 30],[0.07 0.07],'color','k')

% ct1 = find(


