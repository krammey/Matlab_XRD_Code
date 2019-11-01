
% Katrina Ramirez-Meyers
% 
% Plotting data from EC-Lab
% 
function xrd_plotting(file)
%  Run this first addpath('~/GoogleDrive/1_CMU/0_Research/02_XRD/Matlab_XRD_Code/')


cd ~/GoogleDrive/1_CMU/0_Research/02_XRD/
addpath ~/Documents/MATLAB/xrdmlread/ ~/Documents/MATLAB/xmltree/
addpath('/Users/trins/Documents/MATLAB/altmany-export_fig-9d97e2c')

d = XRDMLread(file);
plot( d.x , round(d.data*d.time) , 'k')
ylim([0 1.1*max(round(d.data*d.time))])

box on

xlabel( '2\theta' )
ylabel( 'Intensity' )

title( d.filename , 'Interpreter','none','FontName','Helvetica')
set(gcf,'Color','w')
set(findall(gcf,'-property','FontSize'),'FontSize',13)
% export_fig(char(['./Figures/' replace(d.filename, '.xrdml','') '.pdf']))
% export_fig(char(['./Figures/' replace(d.filename, '.xrdml','') '.fig']))
% export_fig('./Figures/_.fig')
% export_fig('./Figures/_.pdf')


end