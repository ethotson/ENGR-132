%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%You must perform a regression analysis on two sets of data, one which
%records sea level overtime, and one which records sattelite altimeter
%data.
%
% Assigment Information
%   Assignment:     PS 04, Problem 3
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

dataNASA=csvread('Data_NASA_altimeter_gmsl_meas.csv',1,0); %Reads data from NASA sattelite csv file
dataCSIRO=csvread('Data_CSIRO_gmsl_mo_2013.csv',1,0); %Reads data from CSIRO relative sea level file

csiroYear=dataCSIRO(1358:1608,1); %Creates column of years 1993-2013 from CSIRO
csiroLvl=dataCSIRO(1358:1608,2); %Creates column of sea level data from CSIRO

nasaYear=dataNASA(1:784,1); %Creates column of years 1993-2013 from NASA
nasaLvl=dataNASA(1:784,2);%Creates column of sea level data from NASA

%% ____________________
%% CALCULATIONS

regNASA=polyfit(nasaYear,nasaLvl,1);%Performs linear regression on NASA data
nasaPredVals=nasaYear*regNASA(1)+regNASA(2);%Creates predicted values based on NASA linear regression
nasaSSE=sum((nasaLvl-nasaPredVals).^2);%Calculates NASA SSE
nasaSST=sum((nasaLvl-mean(nasaLvl)).^2);%Calculates NASA SST
nasaRSqr=1-nasaSSE/nasaSST;%Calculates NASA R^2 value

regCSIRO=polyfit(csiroYear,csiroLvl,1);%Performs linear regression on CSIRO data
csiroPredVals=csiroYear*regCSIRO(1)+regCSIRO(2);%Creates predicted values based on CSIRO linear regression
csiroSSE=sum((csiroLvl-csiroPredVals).^2);%Calculates CSIRO SSE
csiroSST=sum((csiroLvl-mean(csiroLvl)).^2);%Calculates CSIRO SST
csiroRSqr=1-csiroSSE/csiroSST;%Calculates CSIRO R^2 value

%% ____________________
%% FIGURE DISPLAY
figure(1)%Creates figure
subplot(2,1,1)%Creates subplot for NASA data
plot(nasaYear,nasaLvl,'+b');%plots NASA data
title('Change in Sea Level, 1993-2013, NASA')%Titles the figure
xlabel('Year')%Labels x axis
ylabel('Sea Level relative to mean of 1996-2016')%Labels y axis
grid on%Turns on grid
refline(regNASA(1),regNASA(2));%Graphs NASA linear regression

subplot(2,1,2)%Creates subplot for CSIRO data
plot(csiroYear,csiroLvl,'*r');%plots CSIRO data
title('Change in Sea Level, 1993-2013, NASA')%Titles the figure
xlabel('Year')%Labels x axis
ylabel('Sea Level relative to 1990 midpoint')%Labels y axis
grid on%Turns on grid
refline(regCSIRO(1),regCSIRO(2));%Graphs CSIRO linear regression

%% ____________________
%% TEXT DISPLAY
fprintf('The equation for the NASA linear regression model is y=%0.5fx+%0.5f.\n',regNASA(1),regNASA(2))
fprintf('The SSE, SST and R^2 values for the NASA linear regression are %0.5f,%0.5f and %0.5f, respectively.\n',nasaSSE,nasaSST,nasaRSqr)

fprintf('The equation for the CSIRO linear regression model is y=%0.5fx+%0.5f.\n',regCSIRO(1),regCSIRO(2))
fprintf('The SSE, SST and R^2 values for the CSIRO linear regression are %0.5f,%0.5f and %0.5f, respectively.\n',csiroSSE,csiroSST,csiroRSqr)
%% ____________________
%% ANALYSIS

% -- Q1
% It seems as though the NASA sattelite data is more accurate, as there is
% a known error consideration, which the CSIRO data lacks.

% -- Q2
%The NASA linear regression is far more representative of its dataset, with
%a nearly perfect R^2 value of effectively 1.

% -- Q3
% The CSIRO shows a higher sea level growth rate of 3.56278 as opposed to
% 0.02715.

% -- Q4
% According to the NASA linear regression model, the 2019 sea level will be
% 2047.52974ft above the 1996-2016 mean level. According to the CSIRO
% linear regression model, the 2019 sea level will be 90.46641 ft above the
% 1990 midpoint. However, it would be dangerous to make this assumption, as
% it would be likely to be an innacurate extrapolation on data which does
% not reflect this future period.

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.

