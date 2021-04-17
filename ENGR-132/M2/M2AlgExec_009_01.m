function = M2AlgExec_009_01()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program calls the functions generating yL, yH, tau and start time for each dataset,
% as well as a function which how well these functions model the data,
% which is input by the user.
%
% Function Call
% 
% M2AlgExec_009_01()
%
% Input Arguments
%
% None
%
% Output Arguments
%
% None
%
% Assignment Information
%   Assignment:			Milestone 2, Executive Function
%   Team ID:			009-01
%   Paired Partner:		
%   Team Members:		Ethan Hotson, ehotson@purdue.edu
%                       Coleman Jennewein, cjennewe@purdue.edu
%                       Will Popovich, wpopovic@purdue.edu
%                       Otto Meccia, omeccia@purdue.edu
%   Contributor:		N/A
%   Our contributor(s) helped us:	
%     [ ] understand the assignment expectations without
%         telling us how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping us plan our solution.
%     [ ] think through the meaning of a specific error or
%         bug present in our code without looking at our code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

cleanData = csvread("M2_Data_Calibration_CoolingClean.csv");
noisyData = csvread("M2_Data_Calibration_CoolingNoisy.csv");
cleanHeatData = csvread("M2_Data_Calibration_HeatingClean.csv");
noisyHeatData = csvread("M2_Data_Calibration_HeatingNoisy.csv");

%% ____________________
%% FUNCTION CALLS

[yL1,yH1,tau1,start1] = Project_M2Algorithm1_009_01(cleanData);
[yL2,yH2,tau2,start2] = Project_M2Algorithm2_009_01(cleanData);
line1 = (yL1 + (yH1 - yL1)(exp(-((cleanHeatData(:,start1:)-start1)/tau1)));
line2 = (yL2 + (yH2 - yL2)(exp(-((cleanHeatData(:,1)-start2)/tau2)));

%% ____________________
%% PLOTTING

figure(1)
title("Algorithm 1")
plot(cleanData(:,start1),cleanData(:,2))
grid on

figure(2)
title("Algorithm 2")
plot(cleanData(:,1),cleanData(:,2))
grid on




