function[] = exam2_UDF_choose_model_009_01(xData,yData)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function displays raw user provided x and y data and displays it on
% linear, semilogx, semilogy and loglog scales.
%
% Function Call
% exam2_UDF_choose_model_009_01(x,y)
% 
% Input Arguments
% 1. xData - The user input raw x data which is plotted by the function
% 2. yData - The user input raw y data which is plotted by the function
%
% Output Arguments
% This function has no output arguements
%
% Exam 2 Author Information:
%   Team ID:                            009-01
%   All team members names:             Ethan Hotson, ehotson@purdue.edu
%                                       Otto Meccia, omeccia@purdue.edu
%                                       William Popovich, wpopovic@purdue.edu
%                                       Coleman Jennewein, cjennewe@purdue.edu
%   Primary coder of this function:     Ethan Hotson
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%______________
% FIGURE DISPLAY


figure(1); %Creates figure 1, containing 4 subplots
plot(xData,yData,'.r') %Plots the data with both axes linear
subplot(2,2,1)
grid on
xlabel('X Data (Linear)')
ylabel('Y Data (Linear)')
title('Data, Linear X and Y Scale')

subplot(2,2,2) %Plots the data with x axis logarithmic and y axis linear
semilogx(xData,yData,'.b')
grid on
xlabel('X Data (Logarithmic)')
ylabel('Y Data (Linear)')
title('Data, Logarithmic X Scale')

subplot(2,2,3)%Plots the data with x axis linear and y axis logarithmic
semilogy(xData,yData,'.g')
grid on
xlabel('X Data (Linear)')
ylabel('Y Data (Logarithmic)')
title('Data, Logarithmic Y Scale')

subplot(2,2,4)%Plots the data with x axis and y axis logarithmic
loglog(xData,yData,'.k')
grid on
xlabel('X Data (Logarithmic)')
ylabel('X Data (Logarithmic)')
title('Data, Logarithmic X and Y Scale')

%%____________________________
% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. We have not, and will not, provide 
% access to our code in any way. We are submitting our own original work. 
%%



