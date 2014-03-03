%% make wave with multiple frequencies
   %% Time specifications:
   Fs = 2;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 60;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave:
   F1a = 0.35;
   F1b = 0.2;
   Fva = [0.3 0.26 0.28 0.24 0.26 0.22 0.24];
   x1a = 0.8*sin(2*pi*Fva(1)*t);
   x2a = 0.8*sin(2*pi*Fva(2)*t);
   x3a = 0.8*sin(2*pi*Fva(3)*t);
   x4a = 0.8*sin(2*pi*Fva(4)*t);
   x5a = 0.8*sin(2*pi*Fva(5)*t);
   x6a = 0.8*sin(2*pi*Fva(6)*t);
   x7a = 0.8*sin(2*pi*Fva(7)*t);
   
      Fvb = Fva./12;
   x1b = 0.3*sin(2*pi*Fvb(1)*t);
   x2b = 0.3*sin(2*pi*Fvb(2)*t);
   x3b = 0.3*sin(2*pi*Fvb(3)*t);
   x4b = 0.3*sin(2*pi*Fvb(4)*t);
   x5b = 0.3*sin(2*pi*Fvb(5)*t);
   x6b = 0.3*sin(2*pi*Fvb(6)*t);
   x7b = 0.3*sin(2*pi*Fvb(7)*t);

   y1a = [x1a; x2a; x3a; x4a; x5a; x6a; x7a]';
   y1b = [x1b; x2b; x3b; x4b; x5b; x6b; x7b]';
   y1c = y1a + y1b;
%% 
res=256; %frequency resolution
dt=2; %sampling rate
dj=0.0625; %wavelet interval
% dj = 0.03125;
J1=157; %total # of scales
pad=1; %zero-pad signals
s0=2*dt; %set initial scale
mother='Morlet'; %wavelet shape
param=6; %initial wavelet order

%computes the wavelets
[WN1,~,scales] = wavelet(y1c,dt,pad,dj,s0,J1,mother,param);
freq=1./(1.033*scales);
power1 = abs(WN1).^2;


imagesc(t,freq,power1)
set(gca,'YDir','Normal')
