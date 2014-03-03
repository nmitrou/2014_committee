%% load PC array
load('/Users/nickmitrou/Documents/SFU/PhD/Data/SPN-LNAME-LP/SPN_NAME_cluster/thresholds/2012b23_25hz_2ms_3_PCresults_MYO.mat');
%% plot 4 subplots with phase coherence respective to 4 locations

sig_only(sig_only==0) = NaN;

r1 = 9;
r2 = 22;
c1 = 10;
c2 = 25;

w1 = 0.38;
w2 = 0.45;
h = 0.4;
s = 0.04;
l1 = 0.09;
l2 = l1+w1+s;
b1 = 0.10;
b2 = b1+h+s;

x = 27/4;
y = 37/4;
s1 = squeeze(sig_only(r1,c1,:,:));
s2 = squeeze(sig_only(r2,c1,:,:));
s3 = squeeze(sig_only(r1,c2,:,:));
s4 = squeeze(sig_only(r2,c2,:,:));

subplot('Position',[l1,b2,w1,h])
h1 = imagesc(x,y,s1);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(h1,'alphadata',~isnan(s1))

subplot('Position',[l2,b2,w2,h])
h2 = imagesc(x,y,s2);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(h2,'alphadata',~isnan(s2))
colorbar

subplot('Position',[l1,b1,w1,h])
h3 = imagesc(x,y,s3);
set(h3,'alphadata',~isnan(s3))
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')

subplot('Position',[l2,b1,w2,h])
h4 = imagesc(x,y,s4);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(h4,'alphadata',~isnan(s4))
colorbar

%% Export figure
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/PC_LNAME_4plot.eps',opts);