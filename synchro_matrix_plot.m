load('/Users/nickmitrou/Documents/SFU/PhD/Projects/SPN-LNAME/Data/mat_files/processed_data/thresholds/2013C07_HR_25hz_2ms_2_PCresults_MYO.mat');
pc_vals1M = pc_vals;

load('/Users/nickmitrou/Documents/SFU/PhD/Projects/SPN-LNAME/Data/mat_files/processed_data/thresholds/2013C07_HR_25hz_2ms_3_PCresults_MYO.mat');
pc_vals2M = pc_vals;

load('/Users/nickmitrou/Documents/SFU/PhD/Projects/SPN-LNAME/Data/mat_files/processed_data/thresholds/2013C07_HR_25hz_2ms_2_PCresults_TGF.mat');
pc_vals1T = pc_vals;

load('/Users/nickmitrou/Documents/SFU/PhD/Projects/SPN-LNAME/Data/mat_files/processed_data/thresholds/2013C07_HR_25hz_2ms_3_PCresults_TGF.mat');
pc_vals2T = pc_vals;

[synchmat1M,siz,xpos,ypos] = FormSynchMat(pc_vals1M);

[synchmat2M,siz,xpos,ypos] = FormSynchMat(pc_vals2M);

[synchmat1T,siz,xpos,ypos] = FormSynchMat(pc_vals1T);

[synchmat2T,siz,xpos,ypos] = FormSynchMat(pc_vals2T);

clust_num = 10;
reps = 30;
rr=1:clust_num;
m=1;
W=cell(length(rr),1);
H=cell(length(rr),1);
D=zeros(length(rr),1);
for r=rr
    display(num2str(r))
    [W1{m},H1{m},D1(m)]=nnmf(synchmat1M,r,'alg','mult','rep',reps);
    m=m+1;
end

clust_num = 10;
reps = 5;
rr=1:clust_num;
m=1;
W=cell(length(rr),1);
H=cell(length(rr),1);
D=zeros(length(rr),1);
for r=rr
    display(num2str(r))
    [W2{m},H2{m},D2(m)]=nnmf(synchmat2M,r,'alg','mult','rep',reps);
    m=m+1;
end

rr=1:clust_num;
m=1;
W=cell(length(rr),1);
H=cell(length(rr),1);
D=zeros(length(rr),1);
for r=rr
    display(num2str(r))
    [W3{m},H3{m},D3(m)]=nnmf(synchmat1T,r,'alg','mult','rep',reps);
    m=m+1;
end

rr=1:clust_num;
m=1;
W=cell(length(rr),1);
H=cell(length(rr),1);
D=zeros(length(rr),1);
for r=rr
    display(num2str(r))
    [W4{m},H4{m},D4(m)]=nnmf(synchmat2T,r,'alg','mult','rep',reps);
    m=m+1;
end

Ddiff1 = diff(D1);
Ddiff2 = diff(D2);
Ddiff3 = diff(D3);
Ddiff4 = diff(D4);

Dthresh = 0.01;

k1=find(abs(Ddiff1)<Dthresh,1,'first');
k2=find(abs(Ddiff2)<Dthresh,1,'first');
k3=find(abs(Ddiff3)<Dthresh,1,'first');
k4=find(abs(Ddiff4)<Dthresh,1,'first');
%% 
w1 = 0.37;
w2 = 0.42;
h = 0.4;
sh = 0.0;
sv = 0.04;


l1 = 0.1;
l2 = l1+w+sh;
b1 = 0.1;
b2 = b1+h+sv;


subplot('Position',[l1,b2,w1,h])
imagesc(synchmat1M)
set(gca,'XTickLabel','')
title 'MR'
ylabel 'SPN'
subplot('Position',[l2,b2,w2,h])
imagesc(synchmat1T)
set(gca,'YTickLabel','')
set(gca,'XTickLabel','')
title 'TGF'
colorbar
subplot('Position',[l1,b1,w1,h])
imagesc(synchmat2M)
ylabel 'L-NAME'
subplot('Position',[l2,b1,w2,h])
imagesc(synchmat2T)
set(gca,'YTickLabel','')
colorbar
%% 
% l = 0.13;
% w = 0.8;
% h = 0.4;
% s = 0.08;
% b1 = 0.08;
% b2 = b1+h+s;
% 
% 
% subplot('Position',[l,b2,w,h])
% plot(D1,'k-'); hold on
% plot(D2,'k--')
% plot(D3,'r-')
% plot(D4,'r--')
% plot(k1,D1(k1),'ko')
% plot(k2,D2(k2),'ko')
% plot(k3,D3(k3),'ro')
% plot(k4,D4(k4),'ro')
%     ylabel('D','interpreter','latex','FontSize',14)
%     set(gca,'XTickLabel','')
%     xlim([0 10])
%     box off
%     legend('MR SPN','MR NAME','TGF SPN','TGF NAME','Location','NorthEast')
%     
% subplot('Position',[l,b1,w,h])
plot(Ddiff1,'k-'); hold on
plot(Ddiff2,'k--')
plot(Ddiff3,'r-')
plot(Ddiff4,'r--')
plot(k1,Ddiff1(k1),'ko')
plot(k2,Ddiff2(k2),'ko')
plot(k3,Ddiff3(k3),'ro')
plot(k4,Ddiff4(k4),'ro')
    xlim([0 10])
        legend('MR SPN','MR NAME','TGF SPN','TGF NAME','Location','SouthEast')
    ylabel('$\Delta D$','interpreter','latex','FontSize',14)
    xlabel('Clusters','interpreter','latex','FontSize',14)
    box off
%% Export figure
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.0;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/Sinewave_phase_noise.eps',opts);
