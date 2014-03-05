%% load data
load('/Users/nickmitrou/Documents/SFU/PhD/Projects/SPN-LNAME/Data/mat_files/original_data/2012b23_25hz_2ms_3_imRESIZE.mat');
%% plot surface perfusion and decide on ROI locations
imagesc(squeeze(mean(imRS,3)))
%% Define ROIs
r1 = 25; %row of first ROI
r2 = 25; % row of second ROI
r3 = 9;

c1 = 34; % column of first ROI
c2 = 35;
c3 = 3;

%% plot surface with ROIs labelled as boxes
imagesc(squeeze(mean(imRS,3)));
rectangle('position',[c1,r1,1,1]);
rectangle('position',[c2,r2,1,1]);
rectangle('position',[c3,r3,1,1]);

%% find instantaneous phase with Hilbert transform
[b,a] = butter(4,0.07/1,'low');

sig1 = squeeze(imRS(r1,c1,:));% extract time series of ROI 1

%zero-mean, linearly detrend, and normalize signal to unit variance
sig1n=detrend(sig1)-mean(detrend(sig1));
sig1n=sig1n./std(sig1n);
sig1f = filtfilt(b,a,sig1n);

ansig1 = hilbert(sig1f); % use Hilbert transform to get  discrete time analytic signal 
% insph1 = unwrap((angle(ansig1)));
insph1 = (angle(ansig1));% get phase of analytic signal

sig2 = squeeze(imRS(r2,c2,:));
sig2n=detrend(sig2)-mean(detrend(sig2));
sig2n=sig2n./std(sig2n);
sig2f = filtfilt(b,a,sig2n);

ansig2 = hilbert(sig2f);
% insph2 = unwrap((angle(ansig2)));
insph2 = (angle(ansig2));

sig3 = squeeze(imRS(r3,c3,:));
sig3n=detrend(sig3)-mean(detrend(sig3));
sig3n=sig3n./std(sig3n);
sig3f = filtfilt(b,a,sig3n);

ansig3 = hilbert(sig3f);
% insph3 = unwrap(angle(ansig3));
insph3 = (angle(ansig3));
% power spectrum of each signal
[PSD1,f] = pwelch(sig1,[],[],256,2);
[PSD2,~] = pwelch(sig2,[],[],256,2);
[PSD3,~] = pwelch(sig3,[],[],256,2);

%% smooth phases
ph1 = smooth(insph1,3);
ph2 = smooth(insph2,3);
ph3 = smooth(insph3,3);

%% subtract means from phases
ph1m = ph1.*(2*pi)-mean(ph1.*(2*pi));
ph2m = ph2.*(2*pi)-mean(ph2.*(2*pi));
ph3m = ph3.*(2*pi)-mean(ph3.*(2*pi));

%% compute phase coherence
len = length(ph1);

pc1=abs(1/len.*sum(exp(1i.*(ph1-ph2))))
pc2=abs(1/len.*sum(exp(1i.*(ph1-ph3))))

% COH(1)=abs(1/len.*sum(exp(1i.*(PH1-PH2))));
%%
t = 1:length(sig1);
subplot 121
plot(t,insph1,t,insph2)
subplot 122
plot(t,insph1,t,insph3)
%% 
subplot 211
plot(t,ph1m,'k-',t,ph2m,'r-');
xlim([550 950])
% ylim([-0.1 0.1])
title 'Adjacent ROI'
ylabel 'Instantaneous phase (rad)'
set(gca,'YAxisLocation',[0.05, 0.1, 0.02, 0.3])

subplot 212
plot(t,ph1m,'k-',t,ph3m,'r-');
xlim([550 950])
% ylim([-0.1 0.1])
title 'Distant ROI'
xlabel 'Time (s)'

%% 
% f1 = 0.01;
% f2 = 0.08;
% % [b,a] = butter(16,[f1 f2],'bandpass');
% [phu1,wi1]=PIff(sig1,f1,f2,b,a);
%% 
% t=1:length(sig);
% % sig=normsig(sig);
% %filter and determine instaneous phase and frequency
% sigF=filtfilt(b,a,sig);
% sigH=hilbert(sigF);
% phi=unwrap(angle(sigH));
% phu1=angle(sigH);
% w=diff(phi)./(2*pi);
% 
% %interpolate
% wi=w;
% k1=find(wi<f1);
% kk1=[k1;k1+1;k1-1];
% kk1(kk1<=0)=[];
% kk1(kk1>length(wi))=[];
% ti=t(2:end);
% tt=ti;
% tt(kk1)=[];
% wi(kk1)=[];
% k2=find(wi>f2);
% kk2=[k2;k2+1;k2-1];
% kk2(kk2<=0)=[];
% kk2(kk2>length(wi))=[];
% tt(kk2)=[];
% wi(kk2)=[];
% wi=interp1(tt,wi,ti,'linear','extrap');
% kk=find(isnan(wi)==1);
% wi(kk)=[];
% % ti=1:length(wi);
% 
% phu=phu1(2:end);
% phu(kk1)=[];
% phu(kk2)=[];
% phu=interp1(tt,phu,ti,'linear','extrap')';
%% 
plot(t,ph1m,'k-',t,ph2m,'r-',t,ph3m,'b-')
%% wavelet of ROIs
res=256; %frequency resolution
dt=1; %sampling rate
dj=0.0625; %wavelet interval
J1=127; %total # of scales
pad=1; %zero-pad signals
s0=2*dt; %set initial scale
mother='Morlet'; %wavelet shape
param=6; %initial wavelet order

%computes the wavelets
[WN1,~,scales] = wavelet(sig1,dt,pad,dj,s0,J1,mother,param);
freq=1./(1.033*scales);
power1 = abs(WN1).^2;

[WN2,~,scales] = wavelet(sig2,dt,pad,dj,s0,J1,mother,param);
power2 = abs(WN2).^2;

[WN3,~,scales] = wavelet(sig3,dt,pad,dj,s0,J1,mother,param);
power3 = abs(WN3).^2;

[WN4,~,scales] = wavelet(sig4,dt,pad,dj,s0,J1,mother,param);
power4 = abs(WN4).^2;

[WN5,~,scales] = wavelet(sig5,dt,pad,dj,s0,J1,mother,param);
power5 = abs(WN5).^2;

%% Full plot 
x1=500;
x2=1000;
l1=0.1;
l2=0.6;
b1=0.07;
b2=0.27;
b3=0.47;
b4=0.67;
w=0.34;
h1=0.17;
h2=0.34;
t=1:length(imRS(:,:,:));
linew=1;

subplot('position',[l1,b3,w,h2])
imagesc(squeeze(mean(imRS,3)));
rectangle('position',[c1,r1,1,1],'linewidth',linew,'edgecolor','k');
rectangle('position',[c2,r2,1,1],'linewidth',linew,'edgecolor','r');
rectangle('position',[c3,r3,1,1],'linewidth',linew,'edgecolor','b');

subplot('position',[l1,b2,w,h1])
plot(t,sig1f,'k-',t,sig2f,'r-',t,sig3f,'b-');
xlim([x1 x2])
ylim([800 1050])
title 'A'
ylabel 'Flux (AU)'
set(gca,'XTickLabel','');

subplot('position',[l1,b1,w,h1])
loglog(f,PSD1,'k-',f,PSD2,'r-',f,PSD3,'b-');
xlim([0.01 0.9])
ylim([1 10^5.5])
title 'A'
ylabel 'Power'
set(gca,'XTickLabel','');

subplot('position',[l2,b4,w,h1])
imagesc(t,freq(1:90),power1(1:90,:)); 
set(gca,'Yscale','log')
set(gca,'YDir','Normal')
xlim([x1 x2])
% title 'ROI 1'
% colormap(gray);
set(gca,'XTickLabel','');
% colorbar

subplot('position',[l2,b3,w,h1])
imagesc(t,freq(1:90),power2(1:90,:)); 
set(gca,'Yscale','log')
set(gca,'YDir','Normal')
xlim([x1 x2])
ylabel 'Frequency (Hz)'
% title 'ROI 2'
% colormap(gray);
set(gca,'XTickLabel','');
% colorbar

subplot('position',[l2,b2,w,h1])
imagesc(t,freq(1:90),power3(1:90,:)); 
set(gca,'Yscale','log')
set(gca,'YDir','Normal')
xlim([x1 x2])
% title 'ROI 3'
xlabel 'Time (s)'
% colorbar

subplot('position',[l2,b1,w,h1])
plot(t,ph1m,'k-',t,ph2m,'r-',t,ph3m,'b-');
xlim([x1 x2])
ylim([-0.5 0.5])
% title 'Instantaneous phase of ROI'
ylabel 'Instantaneous phase (rad)'
set(gca,'XTickLabel','');
% xlabel 'Time (s)'

% title 'ROI location'

% subplot 428
% plot(t,sig1f,'k-',t,sig2f,'r-',t,sig3f,'b-');
% xlim([200 700])
%% export eps
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Data/SPN-LNAME-LP/SPN_NAME_cluster/12B23_TGF_Wave_instphase_ROI_2_2.eps',opts);

%% 3D power plots
len = length(power1(:,:));
t = 1:len;
subplot 321
mesh(t,freq(1:90),power1(1:90,:))
set(gca,'Yscale','log')
xlabel 'Time (s)'
ylabel 'Frequency (Hz)'
zlabel 'LS Power (AU^2 Hz^-1)'
title 'ROI 1'
ylim([0.01 0.5])
view(62,34)

subplot 322
mesh(t,freq(1:90),power2(1:90,:))
set(gca,'Yscale','log')
xlabel 'Time (s)'
ylabel 'Frequency (Hz)'
zlabel 'LS Power (AU^2 Hz^-1)'
title 'ROI 2'
ylim([0.01 0.5])
view(62,34)

subplot 323
mesh(t,freq(1:90),power3(1:90,:))
set(gca,'Yscale','log')
xlabel 'Time (s)'
ylabel 'Frequency (Hz)'
zlabel 'LS Power (AU^2 Hz^-1)'
title 'ROI3'
ylim([0.01 0.5])
view(62,34)

subplot 324
mesh(t,freq(1:90),power4(1:90,:))
set(gca,'Yscale','log')
xlabel 'Time (s)'
ylabel 'Frequency (Hz)'
zlabel 'LS Power (AU^2 Hz^-1)'
title 'ROI4'
ylim([0.01 0.5])
view(62,34)

subplot 325
mesh(t,freq(1:90),power5(1:90,:))
set(gca,'Yscale','log')
xlabel 'Time (s)'
ylabel 'Frequency (Hz)'
zlabel 'LS Power (AU^2 Hz^-1)'
title 'ROI5'
ylim([0.01 0.5])
view(62,34)
%% 
COH(1)=abs(1/len.*sum(exp(1i.*(PH1-PH2))));
