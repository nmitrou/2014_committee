%% plot a sine wave to show what phase is

   %% Time specifications:
   Fs = 10;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 150;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave:
   F1a = 0.3;
   F1b = 0.24;
   F2a = 0.025; % hertz
   F2b = 0.013;
   x1a = 0.7*sin(2*pi*F1a*t);
   x2a = 0.2*sin(2*pi*F2a*t);
   y1a = x1a + x2a;
   
   x3a = cos(2*pi*F1a*t);
   x4a = cos(2*pi*F2a*t);
   y2a = x3a+x4a;
   
   w1a = F1a*(2*pi);
   pu1a = w1a*t;
   pw1a = wrapTo2Pi(pu1a);
%% 
   % Plot the signal versus time and show phase progress
   
sincolor = 'k';
circw = 1;
linecolor = 'k';
circcolor1 = 'k';
circcolor2 = 'r';

w = 0.4;
h = 0.22;
s = 0.09;
l = 0.3;
b1 = 0.08;
b2 = b1+s+h;
b3 = b2+s+h;

   
% figure;
subplot('Position', [l,b2,w,h])
    plot(t,x1a,'k')
        xlim([1 5]);
        ylim([-1.57 1.57]);
        ylabel('Amplitude');
        title('Zoomed sinusoid signal');
    
        line([0 length(t)], [0 0], 'LineStyle','--','Color',linecolor);
    
    viscircles([2.5,-1],0.125,'EdgeColor',circcolor1,'LineWidth',circw);
        viscircles([2.5,-0.7],0.05,'EdgeColor',circcolor2,'LineWidth',circw);    
        line([2.5 2.375],[-1 -1],'Color',circcolor1);
        
    viscircles([3.3334, -0.5],0.125,'EdgeColor',circcolor1,'LineWidth',circw);
        viscircles([3.3334,0],0.05,'EdgeColor',circcolor2,'LineWidth',circw);
        line([3.3334 3.3334],[-0.5 -0.625],'Color',circcolor1);
        
    viscircles([4.17, 0.15],0.125,'EdgeColor',circcolor1,'LineWidth',circw);
        viscircles([4.17,0.7],0.05,'EdgeColor',circcolor2,'LineWidth',circw);
        line([4.18 4.055],[0.15 0.15],'Color',circcolor1);
        
    viscircles([1.667, -0.5],0.125,'EdgeColor',circcolor1,'LineWidth',circw);
        viscircles([1.667, 0],0.05,'EdgeColor',circcolor2,'LineWidth',circw);
        line([1.667 1.667],[-0.5 -0.375],'Color',circcolor1);

subplot('Position', [l,b3,w,h])
    plot(t,x1a,'k')
    title('Sinusoid signal')
    ylabel('Amplpitude')
        
subplot('Position', [l,b1,w,h])
    plot(t,pu1a,'k',t,pw1a,'r')
    legend('Phase','Wrapped phase','Location','Best')
    ylabel('Phase (radians)')
    xlabel('Time (s)')
    xlim([0 30])
%% Export figure
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/Sine_wave_phase.eps',opts);

   
    
   
   %% FFT of the first wave
   
  [pxx,f] = pwelch(y1c,[],[],[],10);
  semilogx(f,pxx)
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  %% time varying signal
  
  % options
n = 10; % # frequencies 
fmean = 0.1; % Hz 
nsamples = 1e3; % # samples per constant freq period
% freq
tdur=1/fmean; 
ts = tdur/nsamples; 
f = (fmean/2)*randn(n,1)/3 + fmean;
fvec = []; 
for i=1:n, fvec = [fvec , f(i)*ones(1,nsamples)]; 
end
% algo
fac_old = 0; 
for i=1:length(fvec), fac = fac_old + fvec(i)*ts; 
    y(i) = sin(2*pi*fac); 
    fac_old = fac; 
end
% plot
subplot(211) 
    plot(0:tdur:tdur*(n-1),f,'k.',[0 tdur*n],fmean/2*[1 1],[0 tdur*n],fmean*[1.5 1.5]), ylim([0.25 1.75]*fmean)
subplot(212)
    plot(0:ts:ts*(length(y)-1),y)




