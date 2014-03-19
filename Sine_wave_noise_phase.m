%% phase estimation in presence of noise
   %% Time specifications:
   Fs = 1;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 1500;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave: characteristics
  
      
   F = zeros(1,10);
   
   F(1) = 0.01; %Hz
   F(2) = 0.02;
   F(3) = 0.04;
   F(4) = 0.06;
   F(5) = 0.08;
   F(6) = 0.1;
   F(7) = 0.12;
   F(8) = 0.14;
   F(9) = 0.16;
   F(10) = 0.18;
   
   n1 = 0.*randn(1500,1);
   n2 = 0.01.*randn(1500,1);
   n3 = 0.02.*randn(1500,1);
   n4 = 0.04.*randn(1500,1);
   n5 = 0.08.*randn(1500,1);
   n6 = 0.1.*randn(1500,1);
   n7 = 0.5.*randn(1500,1);
   n8 = 0.6.*randn(1500,1);
   n9 = 0.5.*randn(1500,1);
   n10 = 0.6.*randn(1500,1);
   
   x1 = 0.7*sin(2*pi*F(6)*t)+n1;
   x2 = 0.7*sin(2*pi*F(6)*t)+n2;
   x3 = 0.7*sin(2*pi*F(6)*t)+n3;
   x4 = 0.7*sin(2*pi*F(6)*t)+n4;
   x5 = 0.7*sin(2*pi*F(6)*t)+n5;
   x6 = 0.7*sin(2*pi*F(6)*t)+n6;
   x7 = 0.7*sin(2*pi*F(6)*t)+n7;
   x8 = 0.7*sin(2*pi*F(6)*t)+n8;
   x9 = 0.7*sin(2*pi*F(6)*t)+n9;
   x10 = 0.7*sin(2*pi*F(6)*t)+n10;
   
   
      x1h = hilbert(x1);
   x2h = hilbert(x2);
   x3h = hilbert(x3);
   x4h = hilbert(x4);
   x5h = hilbert(x5);
   x6h = hilbert(x6);
   x7h = hilbert(x7);
   x8h = hilbert(x8);
   x9h = hilbert(x9);
   x10h = hilbert(x10);
  
   phw1 = angle(x1h);
   phw2 = angle(x2h); %wrapped phase
   phw3 = angle(x3h);
   phw4 = angle(x4h);
   phw5 = angle(x5h);
   phw6 = angle(x6h);
   phw7 = angle(x7h);
   phw8 = angle(x8h);
   phw9 = angle(x9h);
   phw10 = angle(x10h);
   
   
   phu1 = unwrap(phw1); %unwrapped phase
   phu2 = unwrap(phw2);
   phu3 = unwrap(phw3);
   phu4 = unwrap(phw4);
   phu5 = unwrap(phw5);
   phu6 = unwrap(phw6);
   phu7 = unwrap(phw7);
   phu8 = unwrap(phw8);
   phu9 = unwrap(phw9);
   phu10 = unwrap(phw10);
   %% Plot 
   l = 0.3;
   w = 0.4;
   h = 0.4;
   s = 0.08;
   b1 = 0.08;
   b2 = b1+h+s;
   
   subplot('Position',[l,b2,w,h])
   plot(t,x8,'color',c1); hold on
   plot(t,x7,'color',c2)
   plot(t,x6,'color',c3)
   plot(t,x1,'color','r')
   
   set(gca,'XTickLabel','')
   ylabel('Amplitude')
   xlim([0 20])
   
   subplot('Position',[l,b1,w,h])
   plot(t,phu8,'color',c1); hold on
   plot(t,phu7,'color',c2)
   plot(t,phu6,'color',c3)
   plot(t,phu1,'color','r')
   
   xlabel('Time (s)')
   ylabel('Instantaneous phase (rad)')

   
   
   
   
   
   
   xlim([0 20])
   
   
   
   
   
   
   
   
   
   
   
   
   %% phase difference
   
   pd1 = phu1-phu2;
   pd2 = phu3-phu4;
   pd3 = phu5-phu6;
   
   t = 1:length(pd1);
   
   plot(t,pd1,t,pd2,t,pd3)

   
   