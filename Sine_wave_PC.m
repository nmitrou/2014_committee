%% plot two sine waves to show PC only detects 1:1 frequency ratio

   %% Time specifications:
   Fs = 1;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 1500;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave: characteristics
   F1 = 0.05; %Hz
   F2 = 0.0499;

   x1 = 0.7*sin(2*pi*F1*t);
   x2 = 0.7*sin(2*pi*F2*t);
   

   x1h = hilbert(x1);
   x2h = hilbert(x2);
   
   phw1 = angle(x1h);
   phw2 = angle(x2h); %wrapped phase
   
   phu1 = unwrap(phw1); %unwrapped phase
   phu2 = unwrap(phw2);
   
   len = length(phu1);
   
   pc=abs(1/len.*sum(exp(1i.*(phu1-phu2))))
%% 
plot(t,x1,t,x2)
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




