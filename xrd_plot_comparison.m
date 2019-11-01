function xrd_plot_comparison(files)
%-----------------------------------
% Load data files
%-----------------------------------

% MnO2 files ------------------------
% file = 'Katrina-MnO2training2.xrdml';
% file = 'Katrina-MnO2training_1.xrdml';
% file = 'Katrina-Cycled-MnO2Bi2O3C-From-Sept42019.xrdml';
% file = 'Katrina-Cycled-MnO2Bi2O3C-From-Sept42019-with-monochrometer.xrdml';;
% file = 'Katrina-UncycledMnO2Bi2O3C.xrdml';
% file1 = '20191024-CycledMnO2-from-20190927-with-monochrom.xrdml'; % 0.02 mA & 0.2 mA
% file2 = '20191017-Bi-MnO2-20191003-with-monochrom.xrdml'; % 0.9 mA
file3 = '20191101-NaOH-CycledMnO2-from-20191030-with-monochrom.xrdml';
file2 = '20191101-CycledMnO2-from-20191028-with-monochrom.xrdml';
file1 = '20191024-UncycledBiMnO2-from-_-with-monochrom.xrdml';

% Ni ------------------------
% file = 'Katrina-CycledNiFoam-From-Sept42019.xrdml';
% file = 'Katrina-CycledNiFoam-From-Sept192019.xrdml';
% file = 'Katrina-NiFoilFrom20191003.xrdml';

% SS ------------------------
% file = 'Katrina-StainlessSteelMesh.xrdml';


% cd ~/GoogleDrive/1_CMU/0_Research/02_XRD/
addpath ~/Documents/MATLAB/xrdmlread/ ~/Documents/MATLAB/xmltree/
addpath('/Users/trins/Documents/MATLAB/altmany-export_fig-9d97e2c')

d1 = XRDMLread(file1);
d2 = XRDMLread(file2);
d3 = XRDMLread(file3);
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
% title( [d1.filename ' \n ' d2.filename ' , ' d3.filename] , 'Interpreter','none','FontName','Helvetica')
% title( [d1.filename ' , ' d2.filename] , 'Interpreter','none','FontName','Helvetica')
% legend('Discharged Only','Cycled Foam', 'Cycled Foil')
leg = legend('Uncycled', '3.5C In KOH','4C In NaOH');
htitle = get(leg,'Title');
set(htitle,'String','Cycling at 1200 \muA)')
set(gcf,'Color','w')
set(findall(gcf,'-property','FontSize'),'FontSize',13)
ylim([0 50])
xlim([10 100])
% xlim([36 37])
% xlim([12 13])
export_fig('./Figures/20191101_KOH-NaOHComparison.pdf')
export_fig('./Figures/20191101_KOH-NaOHComparison.fig')



end