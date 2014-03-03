% Plot Body weight and blood glucose with standard error
load('/Users/nickmitrou/Documents/SFU/PhD/Data/DM-NO/DMNO_BWBG.mat')
%% 
% convert BG to mmol


%%  Body Weight and Blood glucose

l=0.15;
w=0.74;
h=0.32;
s=0.03;
b1=0.2;
b2=b1+h+s;

linew = 1.5; % line width

%%% color definitions
mgrey = [0.4 0.4 0.4]; % med grey
lgrey = [0.25 0.25 0.25]; % light grey
dgrey = [0.55 0.55 0.55]; % dark grey
dblue = [0.1 0.1 1]; % dark blue
lblue = [0.53 0.808 0.9]; %light blue
orng = [1 0.27 0]; % orange
pink = [1 0 1]; % pink

in1c = dblue; % IN1 color
dm1c = orng; % DM1 color
in4c = lblue; % IN4 color
dm4c = pink; % DM4 color

in1l = '-'; % IN1 line style
dm1l = '-'; % DM1 line style
in4l = '-'; % IN4 line style
dm4l = '-'; % DM4 line style

subplot('Position',[l,b2,w,h])
    h1=errorbar(day(1:8),BW_IN1,BW_IN1_SE,'color',in1c,'linewidth',linew,'LineStyle',in1l); hold on
    h2=errorbar(day(1:8),BW_DM1,BW_DM1_SE,'color',dm1c,'linewidth',linew,'LineStyle',dm1l);
    h3=errorbar(day,BW_IN4,BW_IN4_SE,'color',in4c,'linewidth',linew,'LineStyle',in4l);
    h4=errorbar(day,BW_DM4,BW_DM4_SE,'color',dm4c,'linewidth',linew,'LineStyle',dm4l);
        ylabel 'Body Weight (g)'
%         legend('IN-1','DM-1','IN-4','DM-4')
        set(gca,'XTickLabel','')
        xlim([0 28])
        ylim([250 500])
        box off

subplot('Position',[l,b1,w,h])
    h5=errorbar(day(1:8),BG_IN1_mol,BG_IN1_SE_mol,'color',in1c,'linewidth',linew,'LineStyle',in1l); hold on
    h6=errorbar(day(1:8),BG_DM1_mol,BG_DM1_SE_mol,'color',dm1c,'linewidth',linew,'LineStyle',dm1l);
    h7=errorbar(day,BG_IN4_mol,BG_IN4_SE_mol,'color',in4c,'linewidth',linew,'LineStyle',in4l);
    h8=errorbar(day,BG_DM4_mol,BG_DM4_SE_mol,'color',dm4c,'linewidth',linew,'LineStyle',dm4l);
    h9=plot(day(1:8),(BG_DM4_mol(1:8)+8),'k*');
    h10=plot(day,BG_DM4_mol+6,'k*');
        ylabel 'Blood Glucose (mmol/L)'
        xlabel 'Time (days)'
        xlim([0 28])
        ylim([0 34])
        box off

%% Export figure
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/DMNO_BW_BG.eps',opts);