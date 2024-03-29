function xrd_plot_comparison(files)

% NOTES:
% After running this you can adjust graph properties by running: 
% legend('1','2','3')
% title('Enter title')
% xlim([xi xf])

% Export figures:
% export_fig('./Figures/20191101_KOH-NaOHComparison.pdf')
% export_fig('./Figures/20191101_KOH-NaOHComparison.fig')

addpath ~/Documents/MATLAB/xrdmlread/ ~/Documents/MATLAB/xmltree/
addpath('/Users/trins/Documents/MATLAB/altmany-export_fig-9d97e2c')
addpath('~/GoogleDrive/1_CMU/0_Research/02_XRD/Matlab_XRD_Code/')


%-----------------------------------
% Create 'files' input
%-----------------------------------
% cd ~/GoogleDrive/1_CMU/0_Research/02_XRD/
% Before running this, you need to create 'files' as a cell 
% containing the filenames
% file1 = '20191024-UncycledBiMnO2-from-_-with-monochrom.xrdml';
% file2 = '20191101-CycledMnO2-from-20191028-with-monochrom.xrdml';
% file3 = '20191101-NaOH-CycledMnO2-from-20191030-with-monochrom.xrdml';
% files = cell(3,1);
% files{1} = file1;
% files{2} = file2;
% files{3} = file3;


%-----------------------------------
% Load data files
%-----------------------------------
df = cell(length(files),1);
MIN = 0;
MAX = 100;
for i=1:length(files)
    df{i} = XRDMLread(files{i});
    % get highest min and lowest max angles to deal with different 
    MIN = max(MIN,min(df{i}.x)); % minimum angle in data sets
    MAX = min(MAX,max(df{i}.x)); % maximum angle in data sets
end

d = [];
LEG = cell(length(files),1);
for i = 1:length(files)
    data_temp = df{i}.data(MIN <= df{i}.x & df{i}.x <= MAX);
%     length(data_temp)
    d = [d; data_temp];
    LEG{i} =  df{i}.filename;
end

% Adjust vertical positioning of each plot
d2 = d;
d2(2,:) = d(2,:)+0.5*max(d(1,:));
d2(3,:) = d(3,:)+0.5*max(d(1,:))+0.5*max(d(2,:));

plot( df{1}.x , d2)
ylim([0 1.1*max(max(d2))])
box on
xlabel('2\theta')
yticks([])
ylabel( 'Intensity' )
leg = legend(LEG,'Location','southoutside');
htitle = get(leg,'Title');
set(htitle,'String','Enter legend name)')
set(gcf,'Color','w')
set(findall(gcf,'-property','FontSize'),'FontSize',13)
xlim([floor(MIN) ceil(MAX)])


end