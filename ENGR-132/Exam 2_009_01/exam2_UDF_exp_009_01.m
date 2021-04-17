function [m,b] = exam2_UDF_exp_009_01(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program takes (x,y) data and lineiarizes it and plots it with a linear
% model. It then also finds an exponential model and plots the original
% model with this data.
%
% Function Call
% [m,b] = exam2_UDF_exp_009_01(x,y)
%
% Input Arguments
% 1. x % vector of data's x values
% 2. y % vector of data's y values
%
% Output Arguments
% 1. m % scalar m value of exponential model
% 2. b % scalar b value of exponential model
%
% Exam 2 Author Information:
%   Team ID:                            009-01
%   All team members names:             William Popovich, wpopovic@purdue.edu
%                                       Otto Meccia, omeccia@purdue.edu
%                                       Cole Jennewein, cjennewe@purdue.edu
%                                       Ethan Hotson, ehotson@purdue.edu
%   Primary coder of this function:     William Popovich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%______________
% MODEL THE DATA

%linearize the data
linY = log10(y); %find linearized version of x data. (y values are same)
coeffss = polyfit(x,linY,1); %coefficients for linear and exponential model
m = coeffss(1); % m value for linear and exponential model
linb = coeffss(2); % b value for linear model
linYmodel = m * x + linb; %find y values for linear model of data

%find eponential model values
b = 10 .^ linb;
yModel = b * 10 .^ (m * x); %calculate modeled y data with exponential model

%%_______________
% FIGURE DISPLAYS

%plot the linearized data and model
figure(2);
plot(x,linY,'bx',x,linYmodel,'b-')
ylabel("y axis")
xlabel("x axis")
title("Linearized Data and Model")
grid on
legend("Linearized Data","Linearized Model")

%plot the exponential data and model
figure(3)
plot(x,y,'ro',x,yModel,'r--')
ylabel("y axis")
xlabel("x axis")
title("Exponential Data and Model")
grid on
legend("Exponential Data","Exponential Model")

%%_______________________
% FORMATTED TEXT DISPLAYS



%%____________________________
% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. We have not, and will not, provide 
% access to our code in any way. We are submitting our own original work. 
%%



