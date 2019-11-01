function xrd_plot_comparison(files)
cd ~/GoogleDrive/1_CMU/0_Research/02_XRD/
addpath ~/Documents/MATLAB/xrdmlread/ ~/Documents/MATLAB/xmltree/
addpath('/Users/trins/Documents/MATLAB/altmany-export_fig-9d97e2c')


%-----------------------------------
% Create 'files' input
%-----------------------------------
% Before running this, you need to create 'files' as a cell 
% containing the filenames
file1 = '20191024-UncycledBiMnO2-from-_-with-monochrom.xrdml';
file2 = '20191101-CycledMnO2-from-20191028-with-monochrom.xrdml';
file3 = '20191101-NaOH-CycledMnO2-from-20191030-with-monochrom.xrdml';
files = cell(3,1);
files{1} = file1;
files{2} = file2;
files{3} = file3;


%-----------------------------------
% Load data files
%-----------------------------------
df = cell(length(files),1);
MIN = 0;
MAX = 100;
for i=1:length(files)
    df{i} = XRDMLread(files{i});
    % get highest min and lowest max angles to deal with different 
    MIN = max(MIN,min(df{i}.x));
    MAX = min(MAX,max(df{i}.x));
end

d = [];
for i = 1:length(files)
%     if length(df{i}.data) == length(d)
        data_temp = df{i}.data(MIN <= df{i}.x & df{i}.x <= MAX);
        length(data_temp)
%         d = [d; df{i}.data];
%     else
%         angle2 = d2.x;
%         angle1 = d1.x(min(d2.x) <= d1.x & d1.x <= max(d2.x));
%         data1 = d1.data(min(d2.x) <= d1.x & d1.x <= max(d2.x));
%         data2 = d2.data;
%         time1 = d1.time(min(d2.x) <= d1.x & d1.x <= max(d2.x));
%         % d = [round(data1*d1.time);round(data2(1:3046)*d2.time)];%;round(d3.data(1:3046)*d3.time)];
%         d = [data1; data2(1:length(data1))];
%     end
end


if size(d1.x)==size(d2.x)
    angle1 = d1.x;
    d = [d1.data; d2.data+0.3*max(d1.data); d3.data+0.3*max(d1.data)+0.5*max(d2.data)];
else
    angle2 = d2.x;
    angle1 = d1.x(min(d2.x) <= d1.x & d1.x <= max(d2.x));
    data1 = d1.data(min(d2.x) <= d1.x & d1.x <= max(d2.x));
    data2 = d2.data;
    time1 = d1.time(min(d2.x) <= d1.x & d1.x <= max(d2.x));
    % d = [round(data1*d1.time);round(data2(1:3046)*d2.time)];%;round(d3.data(1:3046)*d3.time)];
    d = [data1; data2(1:length(data1))];
end
plot( angle1 , d)
ylim([0 1.1*max(max(d))])
box on
xlabel( [d1.xlabel '(' d1.xunit ')'] )
yticks([])
ylabel( 'Intensity' )
leg = legend('Uncycled', '3.5C In KOH','4C In NaOH');
htitle = get(leg,'Title');
set(htitle,'String','Cycling at 1200 \muA)')
set(gcf,'Color','w')
set(findall(gcf,'-property','FontSize'),'FontSize',13)
ylim([0 50])
xlim([10 100])
% export_fig('./Figures/20191101_KOH-NaOHComparison.pdf')
% export_fig('./Figures/20191101_KOH-NaOHComparison.fig')



end