%% define signal characteristics
fs = 10; % sample frequency (Hz)
dt = 1/fs; % time step (seconds)
dur = 100; % duration (seconds)
t = 0:dt:dur; % time vector (s)
f1 = 0.2; % frequency of wave 1
f2 = 0.02; % frequency of wave 2
prn = 0.85*randn(size(t)); % pseudo-random noise

x1 = sin(2*pi*f1*t) + prn;
x2 = sin(2*pi*f2*t) + prn;
x3 = x1 + x2 + prn;
%% Simulate Rossler flows
n = 500;
level = 8;
a1 = 0.21;
a2 = 0.18;
a3 = 0.16;
b = 0.1;
c = 3;
x0=0.5;
s=length(x0);

x1=mackeyglass(n,level,a1,b,c,x0);
x2=mackeyglass(n,level,a2,b,c,x0);
x3=mackeyglass(n,level,a3,b,c,x0);
%% 
x1 = x1+y1;
x2 = x2+y2;
x3 = x3+y3;
%% plot time domain signal

plot(x3)
title('Noisy time domain signal')
xlim([0 length(x3)])
%% do Fourier transform
y1h = hilbert(x1);

y1 = fft(x1,251);
Pyy1 = y1.*conj(y1)/251;

y1b = fft(y1h,251);
Pyy1h = y1.*conj(y1)/251;

y2 = fft(x2,251);
Pyy2 = y2.*conj(y2)/251;

y3 = fft(x3,251);
Pyy3 = y3.*conj(y3)/251;



f = 1000/251*(0:127);


%% plot FFT
subplot 321
plot(x1)
xlim([0 length(x1)])
title 'Time Domain'
subplot 323
plot(x2)
xlim([0 length(x2)])

subplot 325
plot(x3)
xlabel 'Time (s)'
xlim([0 length(x3)])

subplot 322
semilogx(f(1:50),Pyy1(1:50))
xlim([1 200])
title 'Frequency Domain'
subplot 324
semilogx(f(1:50),Pyy2(1:50))
xlim([1 200])
subplot 326
semilogx(f(1:50),Pyy3(1:50))
xlim([1 200])

xlabel('Frequency (Hz)')