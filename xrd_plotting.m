
% Katrina Ramirez-Meyers
% 
% Plotting data from EC-Lab
% 
function xrd_plotting(file)
% file = 'Katrina-MnO2training2.xrdml';

% file = 'Katrina-MnO2training_1.xrdml';
% file1 = 'Katrina-Cycled-MnO2Bi2O3C-From-Sept42019-with-monochrometer.xrdml';;
% file2 = 'Katrina-CycledNiFoam-From-Sept42019.xrdml';
% file3 = 'Katrina-CycledNiFoam-From-Sept192019.xrdml';
% file4 = 'Katrina-NiFoilFrom20191003.xrdml';
% file = 'Katrina-Bi-MnO2-20101003-with-monochrom.xrdml';
% file = 'Katrina-UncycledMnO2Bi2O3C.xrdml';
% file = '20191024-CycledMnO2-from-20190927.xrdml';

% cd ~/GoogleDrive/1_CMU/0_Research/02_XRD/
addpath ~/Documents/MATLAB/xrdmlread/ ~/Documents/MATLAB/xmltree/
addpath('/Users/trins/Documents/MATLAB/altmany-export_fig-9d97e2c')

%-----------------------------------
% testing plotting multiple files
%-----------------------------------
% file1 = 'Katrina-StainlessSteelMesh.xrdml';
% file2 = 'Katrina-UncycledMnO2Bi2O3C.xrdml';
% file3 = 'Katrina-Cycled-MnO2Bi2O3C-From-Sept42019.xrdml';
% d1 = XRDMLread(file1);
% d2 = XRDMLread(file2);
% d3 = XRDMLread(file3);
% d = [round(d3.data(1:3046)*d3.time);round(d2.data*d2.time)];%;round(d3.data*d3.time)];
% plot( d2.x , d)
% ylim([0 1.1*max(max(d))])
% box on
% xlabel( [d3.xlabel '(' d3.xunit ')'] )
% xticks([])
% ylabel( 'Intensity (counts)' )
% % title( [d1.filename ' \n ' d2.filename ' , ' d3.filename] , 'Interpreter','none','FontName','Helvetica')
% % title( [d2.filename ' , ' d3.filename] , 'Interpreter','none','FontName','Helvetica')
% legend('Discharged Only','Cycled')
% set(gcf,'Color','w')
% set(findall(gcf,'-property','FontSize'),'FontSize',13)
% export_fig('NiComparison.fig')

% semilogy( d.x , round(d.data*d.time) ,'k')
d = XRDMLread(file);
plot( d.x , round(d.data*d.time) , 'k')
ylim([0 1.1*max(round(d.data*d.time))])

box on

xlabel( [d.xlabel '(' d.xunit ')'] )
ylabel( 'Intensity (counts)' )

title( d.filename , 'Interpreter','none','FontName','Helvetica')
set(gcf,'Color','w')
set(findall(gcf,'-property','FontSize'),'FontSize',13)
export_fig(char([replace(d.filename, '.xrdml','') '.pdf']))
export_fig(char([replace(d.filename, '.xrdml','') '.fig']))



end