%% Analysis of signals from moor data
%% load image data and rename the files

filename1 = '/Users/nickmitrou/Documents/SFU/PhD/Data/breezy/14B17_1hz_6';
filename2 = '/Users/nickmitrou/Documents/SFU/PhD/Data/SPN-LNAME-LP/2014B25/Raw_data/2014B25_2';
filename3 = '/Users/nickmitrou/Documents/SFU/PhD/Data/SPN-LNAME-LP/2014B25/Raw_data/2014B25_4';

frame_start = 1;
load_number1 = 10;
load_number2 = 250;

[im1,~,imDC,~]=loadLS(filename1,1,frame_start,load_number1);
[im2,~,~,~]=loadLS(filename2,1,frame_start,load_number1);
[im3,~,~,~]=loadLS(filename3,25,frame_start,load_number2);
%%
imagesc(squeeze(mean(imDC,3))); colormap('gray')
title 'Mean intensity'
%% export image
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/Moor_whole_int.eps',opts);

%% 
imagesc(squeeze(mean(im1,3))); colorbar
title 'Mean flux'
%% export image
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/Moor_whole_flux.eps',opts);

%% 
imagesc(squeeze(mean(im2,3))); colorbar
title 'Mean flux (1 Hz)'
%% export image
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/Moor_zoom_1Hz.eps',opts);

%%
imagesc(squeeze(mean(im3,3))); colorbar
title 'Mean flux (25 Hz)'
%% export image
opts.Format = 'eps';
opts.Width = 7; %width in inches of the output
opts.color = 'RGB';
opts.FontMode = 'scaled';
opts.FontSize = 1.1;
set(gca,'clipping','off');
set(gcf,'clipping','off');
exportfig(gcf,'/Users/nickmitrou/Documents/SFU/PhD/Meetings/Committee_meeting_2014/Moor_zoom_25Hz.eps',opts);
%% 