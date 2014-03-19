%% load data
load('/Users/nickmitrou/Documents/SFU/PhD/Projects/DM-NO/Data/qPCR_csv/DMNO_qpcr_restrictedvalues.mat');
%% calculate delta ct
ref = EF13;
EF1md = -1.*(EF1m-ref);
HMBSd = -1.*(HMBS-ref);
Cx37d = -1.*(Cx37-ref);
Cx43d = -1.*(Cx43-ref);
NOS2d = -1.*(NOS2-ref);
NOS3d = -1.*(NOS3-ref);
COX2d = -1.*(COX2-ref);

% EF1md = 2.^(-1.*EF1md);
% HMBSd = 2.^(-1.*HMBSd);
% Cx37d = 2.^(-1.*Cx37d);
% Cx43d = 2.^(-1.*Cx43d);
% NOS2d = 2.^(-1.*NOS2d);
% NOS3d = 2.^(-1.*NOS3d);
% COX2d = 2.^(-1.*COX2d);
COX2_19 = COX2d(19); % remove animal 12 from all genes, but rename so it is displayed
HMBS_19 = HMBSd(19);
Cx37_19 = Cx37d(19);
Cx43_19 = Cx43d(19);
NOS2_19 = NOS2d(19);
NOS3_19 = NOS3d(19);

COX2d(19) = NaN;
COX2d(19) = NaN;
Cx37d(19) = NaN;
Cx43d(19) = NaN;
NOS2d(19) = NaN;
NOS3d(19) = NaN;
HMBSd(19) = NaN;


%% define x values

s1 = 1;
e1 = 6;

s2 = 7;
e2 = 11;

s3 = 12;
e3 = 18;

s4 = 19;
e4 = 25;

x1 = Group(s1:e1);
x2 = Group(s2:e2);
x3 = Group(s3:e3);
x4 = Group(s4:e4);

x5 = x1 + 4;
x6 = x2 + 4;
x7 = x3 + 4;
x8 = x4 + 4;

x9 = x5 + 4;
x10 = x6 + 4;
x11 = x7 + 4;
x12 = x8 + 4;

x13 = x9 + 4;
x14 = x10 + 4;
x15 = x11 + 4;
x16 = x12 + 4;

x17 = x13 + 4;
x18 = x14 + 4;
x19 = x15 + 4;
x20 = x16 + 4;

x21 = x17 + 4;
x22 = x18 + 4;
x23 = x19 + 4;
x24 = x20 + 4;

x25 = x21 + 4;
x26 = x22 + 4;
x27 = x23 + 4;
x28 = x24 + 4;


%% plot expression
load('/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/colors_teal_rgb.mat');
linest = 'none';
marker = 'o';
barw = 0.3;

gene = HMBSd;

plot(x1,gene(s1:e1),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c1,'MarkerFaceColor',c1); hold on
plot(x2,gene(s2:e2),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c2,'MarkerFaceColor',c2)
plot(x3,gene(s3:e3),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c3,'MarkerFaceColor',c3)
plot(x4,gene(s4:e4),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor',c4)
plot(4,HMBS_19,'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor','r')

line([1-barw 1+barw],[mean(gene(s1:e1)) mean(gene(s1:e1))],'color','k','linewidth',2)
line([2-barw 2+barw],[mean(gene(s2:e2)) mean(gene(s2:e2))],'color','k','linewidth',2)
line([3-barw 3+barw],[nanmean(gene(s3:e3)) nanmean(gene(s3:e3))],'color','k','linewidth',2)
line([4-barw 4+barw],[nanmean(gene(s4:e4)) nanmean(gene(s4:e4))],'color','k','linewidth',2)

gene = Cx37d;

plot(x5,gene(s1:e1),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c1,'MarkerFaceColor',c1); hold on
plot(x6,gene(s2:e2),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c2,'MarkerFaceColor',c2)
plot(x7,gene(s3:e3),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c3,'MarkerFaceColor',c3)
plot(x8,gene(s4:e4),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor',c4)
plot(8,Cx37_19,'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor','r')

line([5-barw 5+barw],[mean(gene(s1:e1)) mean(gene(s1:e1))],'color','k','linewidth',2)
line([6-barw 6+barw],[mean(gene(s2:e2)) mean(gene(s2:e2))],'color','k','linewidth',2)
line([7-barw 7+barw],[nanmean(gene(s3:e3)) nanmean(gene(s3:e3))],'color','k','linewidth',2)
line([8-barw 8+barw],[nanmean(gene(s4:e4)) nanmean(gene(s4:e4))],'color','k','linewidth',2)


gene = Cx43d;

plot(x9,gene(s1:e1),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c1,'MarkerFaceColor',c1); hold on
plot(x10,gene(s2:e2),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c2,'MarkerFaceColor',c2)
plot(x11,gene(s3:e3),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c3,'MarkerFaceColor',c3)
plot(x12,gene(s4:e4),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor',c4)
plot(12,Cx43_19,'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor','r')

line([9-barw 9+barw],[mean(gene(s1:e1)) mean(gene(s1:e1))],'color','k','linewidth',2)
line([10-barw 10+barw],[mean(gene(s2:e2)) mean(gene(s2:e2))],'color','k','linewidth',2)
line([11-barw 11+barw],[mean(gene(s3:e3)) mean(gene(s3:e3))],'color','k','linewidth',2)
line([12-barw 12+barw],[nanmean(gene(s4:e4)) nanmean(gene(s4:e4))],'color','k','linewidth',2)


gene = NOS2d;

plot(x13,gene(s1:e1),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c1,'MarkerFaceColor',c1); hold on
plot(x14,gene(s2:e2),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c2,'MarkerFaceColor',c2)
plot(x15,gene(s3:e3),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c3,'MarkerFaceColor',c3)
plot(x16,gene(s4:e4),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor',c4)
% plot(16,NOS2_12,'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor','r')
plot(16,NOS2_19,'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor','r')

line([13-barw 13+barw],[mean(gene(s1:e1)) mean(gene(s1:e1))],'color','k','linewidth',2)
line([14-barw 14+barw],[mean(gene(s2:e2)) mean(gene(s2:e2))],'color','k','linewidth',2)
line([15-barw 15+barw],[mean(gene(s3:e3)) mean(gene(s3:e3))],'color','k','linewidth',2)
line([16-barw 16+barw],[nanmean(gene(s4:e4)) nanmean(gene(s4:e4))],'color','k','linewidth',2)


gene = NOS3d;

plot(x17,gene(s1:e1),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c1,'MarkerFaceColor',c1); hold on
plot(x18,gene(s2:e2),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c2,'MarkerFaceColor',c2)
plot(x19,gene(s3:e3),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c3,'MarkerFaceColor',c3)
plot(x20,gene(s4:e4),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor',c4)
plot(20,NOS3_19,'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor','r')

line([17-barw 17+barw],[mean(gene(s1:e1)) mean(gene(s1:e1))],'color','k','linewidth',2)
line([18-barw 18+barw],[mean(gene(s2:e2)) mean(gene(s2:e2))],'color','k','linewidth',2)
line([19-barw 19+barw],[nanmean(gene(s3:e3)) nanmean(gene(s3:e3))],'color','k','linewidth',2)
line([20-barw 20+barw],[nanmean(gene(s4:e4)) nanmean(gene(s4:e4))],'color','k','linewidth',2)


gene = COX2d;

plot(x21,gene(s1:e1),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c1,'MarkerFaceColor',c1); hold on
plot(x22,gene(s2:e2),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c2,'MarkerFaceColor',c2)
plot(x23,gene(s3:e3),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c3,'MarkerFaceColor',c3)
plot(x24,gene(s4:e4),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor',c4)
plot(24,COX2_19,'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor','r')

line([21-barw 21+barw],[mean(gene(s1:e1)) mean(gene(s1:e1))],'color','k','linewidth',2)
line([22-barw 22+barw],[mean(gene(s2:e2)) mean(gene(s2:e2))],'color','k','linewidth',2)
line([23-barw 23+barw],[nanmean(gene(s3:e3)) nanmean(gene(s3:e3))],'color','k','linewidth',2)
line([24-barw 24+barw],[nanmean(gene(s4:e4)) nanmean(gene(s4:e4))],'color','k','linewidth',2)


% gene = COX2d;
% 
% plot(x25,gene(s1:e1),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c1,'MarkerFaceColor',c1); hold on
% plot(x26,gene(s2:e2),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c2,'MarkerFaceColor',c2)
% plot(x27,gene(s3:e3),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c3,'MarkerFaceColor',c3)
% plot(x28,gene(s4:e4),'LineStyle',linest,'Marker',marker,'MarkerEdgeColor',c4,'MarkerFaceColor',c4)
% 
% line([25-barw 25+barw],[mean(gene(s1:e1)) mean(gene(s1:e1))],'color','k','linewidth',2)
% line([26-barw 26+barw],[nanmean(gene(s2:e2)) nanmean(gene(s2:e2))],'color','k','linewidth',2)
% line([27-barw 27+barw],[nanmean(gene(s3:e3)) nanmean(gene(s3:e3))],'color','k','linewidth',2)
% line([28-barw 28+barw],[mean(gene(s4:e4)) mean(gene(s4:e4))],'color','k','linewidth',2)


ylabel('$-\Delta Ct$','interpreter','latex','fontsize',15)
xlabel('Gene of interest','interpreter','latex','fontsize',15)
legend('IN1','DM1','IN4','DM4','Location','NorthWest')
set(gca,'XTick',[2.5,6.5,10.5,14.5,18.5,22.5])
% ylim([2 22])
title('Expression relative to $EF1\alpha$','Interpreter','latex','FontSize',13)
% set(gca,'YScale','log')
set(gca,'XTickLabel',{'HMBS','Cx37','Cx43','NOS2','NOS3','COX2'})
ylim([-21 16])

