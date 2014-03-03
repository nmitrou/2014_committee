%% load transfer function data
load('/Users/nickmitrou/Documents/SFU/PhD/Data/DM-NO/DMNO_TFX_RBFBP_LSBP_SE.mat')

%% 
h = 0.4;
s = 0.08;
w = 0.4;
l = 0.3;
b2 = 0.08;
b1 = b2 + h + s;




subplot('Position', [l, b1, w, h])
    errorbar(f,PSDrbf_IN1_2,PSDrbf_IN1_2se,'color','k')
        set(gca, 'xscale', 'log')
        set(gca, 'yscale', 'linear')
        set(gca, 'XTickLabel', '')
        xlim([0.01 0.9])
        title 'RBF'
        box off
        
subplot('Position', [l, b2, w, h])
    errorbar(f,PSDls_IN1_2,PSDls_IN1_2se,'color','k')
        set(gca,'xscale','log')
        set(gca,'yscale','linear')
        xlim([0.01 0.9])
        title 'LSPI'
        xlabel 'Frequency (Hz)'
        ylabel 'Power (AU^2/Hz)'
        box off
%% Export figure
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/RBF_LS_power.eps',opts);