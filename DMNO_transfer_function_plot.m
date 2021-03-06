%% Load transfer function data
load('/Users/nickmitrou/Documents/SFU/PhD/Data/DM-NO/DMNO_TFX_RBFBP_LSBP_SE.mat')
load('/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/colors_teal_rgb.mat')
%% plot RBF transfer function
% figure
% define subplot sizes (units are fraction of total frame size
w = 0.3; % panel width
h = 0.19; % panel height
s = 0.035; % panel separation
l = 0.3; % left margin position
b1 = 0.08; % bottom positions
b2 = b1+h+s;
b3 = b2+h+s;
b4 = b3+h+s;

per = 2;

linew = 1; % line width

texth = 0.011;


%%% color definitions
mgrey = [0.4 0.4 0.4]; % med grey
lgrey = [0.25 0.25 0.25]; % light grey
dgrey = [0.55 0.55 0.55]; % dark grey
dblue = [0.1 0.1 1]; % dark blue
lblue = [0.53 0.808 0.9]; %light blue
orng = [1 0.27 0]; % orange
pink = [1 0 1]; % pink

in1c = lblue; % IN1 color
dm1c = orng; % DM1 color
in4c = dblue; % IN4 color
dm4c = pink; % DM4 color

in1l = '-'; % IN1 line style
dm1l = '-'; % DM1 line style
in4l = '-'; % IN4 line style
dm4l = '-'; % DM4 line style

subplot('Position',[l,b4,w,h])
%     errorbar(f,PSDrbf_IN1_2,PSDrbf_IN1_2se,'color', in1c,'LineStyle',in1l,'LineWidth',linew)
    errorbar(f,PSDbp_IN1_2,PSDbp_IN1_2se,'color', in1c,'LineStyle',in1l,'LineWidth',linew)      
    set(gca,'xscale','log')
        set(gca,'yscale','log')
        set(gca,'XTickLabel','')
        xlim([0.01 0.9])
        ylim([10^-1 10^2.3])
        text(texth,100,'A','FontSize',16,'FontWeight','bold')
        box off        
hold on
%     errorbar(f,PSDrbf_IN4_2,PSDrbf_IN4_2se,'color',in4c,'LineStyle',in4l,'LineWidth',linew)
%     errorbar(f,PSDrbf_DM4_2,PSDrbf_DM4_2se,'color',dm4c,'LineStyle',dm4l,'LineWidth',linew)
%     errorbar(f,PSDrbf_DM1_2,PSDrbf_DM1_2se,'color',dm1c,'LineStyle',dm1l,'LineWidth',linew)
      
    errorbar(f,PSDbp_IN4_2,PSDbp_IN4_2se,'color',in4c,'LineStyle',in4l,'LineWidth',linew)
    errorbar(f,PSDbp_DM4_2,PSDbp_DM4_2se,'color',dm4c,'LineStyle',dm4l,'LineWidth',linew)
    errorbar(f,PSDbp_DM1_2,PSDbp_DM1_2se,'color',dm1c,'LineStyle',dm1l,'LineWidth',linew)
        ylabel 'AP Power (mmHg^2/Hz)'
%%%%%%%%%%%%%%%%%%%% inset %%%%%%%%%%%%%%%%%%%%       
%         s = 10;
%         e = 60;
%             axes('Position',[0.34,0.79,0.1,0.07]); hold on
%                 errorbar(f(s:e),PSDbp_IN1_2(s:e),PSDbp_IN1_2se(s:e),'color', in1c,'LineStyle',in1l,'LineWidth',linew)
%                 errorbar(f(s:e),PSDbp_IN4_2(s:e),PSDbp_IN4_2se(s:e),'color',in4c,'LineStyle',in4l,'LineWidth',linew)
%                 errorbar(f(s:e),PSDbp_DM4_2(s:e),PSDbp_DM4_2se(s:e),'color',dm4c,'LineStyle',dm4l,'LineWidth',linew)
%                 errorbar(f(s:e),PSDbp_DM1_2(s:e),PSDbp_DM1_2se(s:e),'color',dm1c,'LineStyle',dm1l,'LineWidth',linew)
%                         set(gca,'xscale','log')
% %                         set(gca,'yscale','log')
% %                         set(gca,'XTickLabel','')
%                         xlim([f(s) f(e)])
%                         ylim([10^0 10^2])
%                         box off 
%%%%%%%%%%%%%%%%%%%% full size %%%%%%%%%%%%%%%%%%%%
subplot('Position',[l,b3,w,h])
    errorbar(f,coh_IN1_2,coh_IN1_2se,'color',in1c,'LineStyle',in1l,'LineWidth',linew)
        set(gca,'xscale','log')
        set(gca,'XTickLabel','')
        xlim([0.01 0.9])
        box off
hold on
    errorbar(f,coh_IN4_2,coh_IN4_2se,'color',in4c,'LineStyle',in4l,'LineWidth',linew)
    errorbar(f,coh_DM4_2,coh_DM4_2se,'color',dm4c,'LineStyle',dm4l,'LineWidth',linew)
    errorbar(f,coh_DM1_2,coh_DM1_2se,'color',dm1c,'LineStyle',dm1l,'LineWidth',linew)
        ylabel 'Coherence^2'
        line([0.01 1],[0.5 0.5],'LineStyle','--','Color','k')
        text(texth,0.9,'B','FontSize',16,'FontWeight','bold')
        
subplot('Position',[l,b2,w,h])
    errorbar(f,gain_IN1_2,gain_IN1_2se,'color',in1c,'LineStyle',in1l,'LineWidth',linew)
        set(gca,'xscale','log')
        set(gca,'XTickLabel','')
        xlim([0.01 0.9])
        box off
hold on
    errorbar(f,gain_IN4_2,gain_IN4_2se,'color',in4c,'LineStyle',in4l,'LineWidth',linew)
    errorbar(f,gain_DM4_2,gain_DM4_2se,'color',dm4c,'LineStyle',dm4l,'LineWidth',linew)
    errorbar(f,gain_DM1_2,gain_DM1_2se,'color',dm1c,'LineStyle',dm1l,'LineWidth',linew)
        ylim([-20 15])
        ylabel 'Gain (dB)'
%         xlabel 'Frequency (Hz)'
        line([0.01 1],[0 0],'LineStyle','--','Color','k')
        text(texth,11.5,'C','FontSize',16,'FontWeight','bold')
        
subplot('Position',[l,b1,w,h])
    errorbar(f,phase_IN1_2,phase_IN1_2se,'color',in1c,'LineStyle',in1l,'LineWidth',linew)
        set(gca,'xscale','log')
        xlim([0.01 0.9])
        box off
hold on
    errorbar(f,phase_IN4_2,phase_IN4_2se,'color',in4c,'LineStyle',in4l,'LineWidth',linew)
    errorbar(f,phase_DM4_2,phase_DM4_2se,'color',dm4c,'LineStyle',dm4l,'LineWidth',linew)
    errorbar(f,phase_DM1_2,phase_DM1_2se,'color',dm1c,'LineStyle',dm1l,'LineWidth',linew)
        ylim([-0.757 3.14])
        ylabel 'Phase (rad)'
        xlabel 'Frequency (Hz)'
        line([0.01 1],[0 0],'LineStyle','--','Color','k')
        text(texth,2.8,'D','FontSize',16,'FontWeight','bold')
%% Export figure
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/DMNO_transferfx_CTL.eps',opts);
