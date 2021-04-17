function [m, b] = exam2_UDF_log_009_01(x_data, y_data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This UDF assumes that the inputs are logarathmic data and will linearize
% them. It will take in raw data x and raw data y and convert it to a
% linear m and b value. 
%
% Function Call
% [m, b] = exam2_UDF_log_009-01(x_data, y_data)
%
% Input Arguments
% x_data % This is the x data entered into the function as a vector
% y_data % This is the y data entered into the function as a vector
%
% Output Arguments
% m % This is the slope of the linearized function as a scalar.
% b % This is the b value or "intercept" of the linearized data as a
% scalar.
%
% Exam 2 Author Information:
%   Team ID:                            009-01
%   All team members names:             OTTO MECCCIA omeccia@purdue.edu
%                                       WILL POPOVICH wpopovic@purdue.edu
%                                       COLE JENNEWEIN cjennewe@purdue.edu
%                                       ETHAN HOTSON ehotson@purdue.edu
%   Primary coder of this function:     OTTO MECCIA omeccia@purdue.edu
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%______________
% MODEL THE DATA\
%This will make the linear model for the data.
x_data = log10(x_data); %linearizes the x data for further use
mb_log = polyfit((x_data), y_data, 1); %This will linearized the input data and give outputs of m and b.
linearized_log = mb_log(1) * (x_data) + mb_log(2); %This will compute the linear data for the set and provide us with a trendline.
m = mb_log(1); %assigns the calculated m to the output m
b = mb_log(2); %assigns the calculated b to the output b
%This will make the Logarithmic model for the data.
logarithmic_data = m * (x_data) + b; %This will compute the power function based on the given information and the polyfit data.

%%_______________
% FIGURE DISPLAYS
%This figure will plot the inputted data linearly.
figure(2);
hold all;
plot((x_data), y_data, 'b.'); %linearized x data with y data
plot((x_data), linearized_log, 'b-'); %linearized x data with linear y function
grid on;
xlabel 'Linearized X Data';
ylabel 'Logarithmic Y data';
title 'Linear Log Data With Model';
legend("Raw Linear Data","Modeled Trendline","Location","SouthEast");

%This figure will plot the logarithmic data along with the best fit line.
figure(3);
hold all;
%NOTE: for the two plots in this case I had to "re-logarithmize" the x
%data, hence the 10 .^ x_data.
plot(10 .^ (x_data), y_data, 'k.'); %plots the raw logarithmic data 
plot(10 .^ (x_data), logarithmic_data, 'k-'); %plots the trendline for the logarithmic data
grid on;
xlabel 'Logarithmic X Data';
ylabel 'Logarithmic Y Data';
title 'Raw Logarithmic Data and Model';
legend("Raw Power Data","Modeled Power Trendline","Location","SouthEast");

%%_______________________
% FORMATTED TEXT DISPLAYS
% all formatted text will come from the main script, not my UDF.

%%____________________________
% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. We have not, and will not, provide 
% access to our code in any way. We are submitting our own original work
%Signed: Otto Meccia
%%


