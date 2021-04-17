function Project_M2Calibration_009_01()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program determines how well the user defined functions also included
% in the executive function model the data provided by the user.
%
% Function Call
% 
% M2Calibration_009_01(yL,yH,tau,tStart)
%
% Input Arguments
%
% None
%
% Output Arguments
%
% None
%
% minLengths - A vector of the minimum lengths of conducting rod required
% for the set of diameters.
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

yL_HC = 0.00;
yH_HC = 100.00;
tau_HC = 0.31;
tStart_HC = 1.50;

yL_HN = -0.70;
yH_HN = 98.90;
tau_HN = 1.65;
tStart_HN = 1.50;

yL_CC = 0.96;
yH_CC = 100.0;
tau_CC = 1.82;
tStart_CC = 1.50;

yL_CN = -0.67;
yH_CN = 98.91;
tau_CN = 1.12;
tStart_CN = 1.50;

ccData = csvread("M2_Data_Calibration_CoolingClean.csv");
ncData = csvread("M2_Data_Calibration_CoolingNoisy.csv");
chData = csvread("M2_Data_Calibration_HeatingClean.csv");
nhData = csvread("M2_Data_Calibration_HeatingNoisy.csv");

%% ____________________
%% CALCULATIONS

heatfX = yL_HC + (yH_HC - yL_HC)*((1 - exp((-(chData(find(chData(:,1) == tStart_HC):numel(chData(:,1)),1))-tStart_HC)/tau_HC)));
heatnoisefX = yL_HN + (yH_HN - yL_HN)*((1 - exp((-(nhData(find(nhData(:,1) == tStart_HN):numel(nhData(:,1)),1))-tStart_HN)/tau_HN)));
heatStart = ones(find(chData(:,1) == tStart_HC)-1,1).*yL_HC;
heatNoiseStart = ones(find(nhData(:,1) == tStart_HN)-1,1).*yL_HN;
heat = [heatStart; heatfX];
heatNoise = [heatNoiseStart; heatnoisefX];
sseHeatClean = sum(sum(((chData(:,2))-heat)).^2)/(numel(chData(:,1)));
sseHeatNoise = sum(sum(((nhData(:,2))-heatNoise)).^2)/(numel(nhData(:,1)));

coolfX = yL_CC + (yH_CC - yL_CC)*(exp((-(ccData(find(ccData(:,1) == tStart_CC):numel(ccData(:,1)),1)) - tStart_CC)/tau_CC));
coolnoisefX = yL_CN + (yH_CN - yL_CN)*(exp((-(ncData(find(ncData(:,1) == tStart_CN):numel(ncData(:,1)),1)) - tStart_CN)/tau_CN));
coolStart = ones(find(ccData(:,1) == tStart_CC)-1,1).*yH_CC;
coolNoiseStart = ones(find(ncData(:,1) == tStart_CN)-1,1).*yH_CN;
cool = [coolStart; coolfX];
coolNoise = [coolNoiseStart; coolnoisefX];
sseCoolClean = sum(sum((ccData(:,2)-cool)).^2)/(numel(ccData(:,1)));
sseCoolNoise = sum(sum(((ncData(:,2)-coolNoise)).^2)/(numel(ncData(:,1))));

%% ____________________
%% PLOTTING

figure(1)
subplot(2,1,1)
plot(chData(:,1),heat,'r-',chData(:,1),chData(:,2),'c.')
title("Clean Heating Data and Model")
xlabel("Time (s)")
ylabel("Temperature (deg C)")
grid on

subplot(2,1,2)
plot(nhData(:,1),heatNoise,'c',nhData(:,1),nhData(:,2),'r-')
title("Noisy Heating Data and Model")
xlabel("Time (s)")
ylabel("Temperature (deg C)")
grid on

figure(2)
subplot(2,1,1)
plot(ccData(:,1),cool,'b-',ccData(:,1),ccData(:,2),'r.')
title("Clean Cooling Data and Model")
xlabel("Time (s)")
ylabel("Temperature (deg C)")
grid on

subplot(2,1,2)
plot(ncData(:,1), coolNoise, 'r',ncData(:,1),ncData(:,2),'b-')
title("Noisy Cooling Data and Model")
xlabel("Time (s)")
ylabel("Temperature (deg C)")
grid on

fprintf("The SSE for Clean Heating data is: %f\n",sseHeatClean)
fprintf("The SSE for Noisy Heating data is: %f\n",sseHeatNoise)
fprintf("The SSE for Clean Cooling data is: %f\n",sseCoolClean)
fprintf("The SSE for Noisy Cooling data is: %f\n",sseCoolNoise)
