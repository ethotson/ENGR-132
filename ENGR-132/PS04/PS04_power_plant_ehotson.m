%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% You must convert the least squares analysis from Problem 1 into MATLAB
% code, as well as determining a linear model for the same data using
% MATLAB functions.
%
% Assigment Information
%   Assignment:     PS 04, Problem 2
%   Author:         Ethan Hotson, ehotson@purdue.edu
%   Team ID:        009-01
%  	Contributor:    N/A
%   My contributor(s) helped me:	
%     [ ] understand the assignment expectations without
%         telling me how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping me plan my solution.
%     [ ] think through the meaning of a specific error or
%         bug present in my code without looking at my code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

powerData=csvread('Data_power_measurements.csv',1,0);%Reads the data on power measurements
ambTemp=powerData(:,1);%Creates x value vector
netHrMW=powerData(:,2);%Creates y value vector

%% ____________________
%% CALCULATIONS

reg=polyfit(ambTemp,netHrMW,1);%Performs a linear regression on the data using polyfit

predVals=ambTemp*reg(1,1)+reg(1,2);%Creates a set of data based on the theoretical results using the linear model

powSSE=sum((netHrMW-predVals).^2);%Calculates the SSE of the regression

powSST=sum((netHrMW-mean(netHrMW)).^2);%Calculates the SST of the regression

powRSqr=1-powSSE/powSST;%Calculates the R^2 value of the regression

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
%Prints the equation and SSE, SST and R^2 of the regression model.
fprintf('The equation for the linear regression model is y=%0.5fx+%0.5f.\n',reg(1),reg(2))
fprintf('The SSE, SST and R^2 values for the linear regression are %0.5f,%0.5f and %0.5f, respectively.\n',powSSE,powSST,powRSqr)

figure(1)%Creates figure
hold all%Holds all plots to figure 1
title('Net Hourly Electrical Output at different Ambient Temperatures')%Titles the figure
xlabel('Ambient Temperature (C)')%Labels x axis
ylabel('Net Hourly Electrical Output(MW)')%Labels y axis
grid on%Turns on grid
plot(ambTemp,netHrMW,'*r')%Plots the ambient temperature vs. the net electrical energy generated
refline(reg(1),reg(2))%Plots the linear regression reg


%% ____________________
%% ANALYSIS

%% -- Q1
% My matlab least squares regression is much more accurate, which may
% indicate I did something wrong in my excel calculations. My method of
% plotting the regression line in matlab also shows an extrapolation I
% would not make in both directions.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.