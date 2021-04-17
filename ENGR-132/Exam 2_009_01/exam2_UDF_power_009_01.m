function [m,b] = exam2_UDF_power_009_01(x_data,y_data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program models x and y data as a power function. It linearizesthe
% data, gets modeled y data, finds the parameters of the non-transformed
% model, plots the raw data and model, outputs the parameters, and prints
% the final equation to the screen.
%
% Function Call
%[m_parameter,b_parameter] = exam2_UDF_power_SEC_TM(x_data,y_data)
% Input Arguments
% 1. x_data % (scalar) the raw x data to be modeled
% 2. y_data % (scalar) the raw y data to be modeled
% Output Arguments
% 1. m_parameter % the m value of the linearized model
% 2. b_parameter % the b value of the linearized model
% Exam 2 Author Information: Cole Jennewein (cjennewe)
%   Team ID:                            009-01
%   All team members names:             Cole Jennewein, cjennewe@purdue.edu
%                                       Will Popovic, wpopovic@purdue.edu
%                                       Otto Meccia, omeccia@purdue.edu
%                                       Ethan Hotson, ehotson@purdue.edu
%   Primary coder of this function:     Cole Jennewein
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%______________
% MODEL THE DATA
%Linearizes the data
x_data_linear = log10(x_data); %Linearizes x_data by taking the log10 of x
y_data_linear = log10(y_data); %Linearized y_data by taking the log10 of y

%Finds the linear model for the data
linearCoefficients = polyfit(x_data_linear,y_data_linear,1); % Finds the coefficients of the linear model
linearM = linearCoefficients(1,1); %Assigns the m value of the linear model to linearM
linearB = linearCoefficients(1,2); %Assigns the b value of the linear model to linearB
linearModel = linearM * x_data_linear + linearB; %Calculates the Y values using the linear model for X

%Labels finds general form values for the power model
m = linearM; %Assigns the linearM to m
b = 10^linearB; %Finds the general form for linearB

originalModel = b*(x_data).^m; %Calculates the y values for X using the power model

%%_______________
% FIGURE DISPLAYS

%Plots the linearized model and the linearized y data over linearized x data
figure(2)
plot(x_data_linear,y_data_linear,"rs")
grid on;
title("Linearized Y data and Y model over X data");
xlabel("linearized X data");
ylabel("linearized Y data");
hold on;
plot(x_data_linear,linearModel,"r")
legend("raw linearized data","linear Model","location","best");

%Plots the power model and the raw y data over the raw x data 
figure(3)
plot(x_data,y_data,"bs")
grid on;
title("Original Y data and power model over X data");
xlabel("X data")
ylabel("Y data")
hold on;
plot(x_data,originalModel)
legend("raw data","power model","location","best");





%%_______________________
% FORMATTED TEXT DISPLAYS



%%____________________________
% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. We have not, and will not, provide 
% access to our code in any way. We are submitting our own original work. 
%%