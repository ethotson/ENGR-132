%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%You work for an audio company which is designing new headphones, and
%associated volume control systems. You must analyze the data from two
%prototype heaphone designs.
%
% Assigment Information
%   Assignment:     PS 03, Problem 2
%   Author:         Ethan Hotson, ehotson@purdue.edu
%   Team ID:        009-01
%  	Contributor:    None
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

headphoneData=csvread('Data_volume_power.csv',2,0); %Reads headphone csv data
headphonePower=headphoneData(:,1); %Seperates headphone power data
oep4Volume=headphoneData(:,2); %Finds heapdhone OEP4 volume data
iep3Volume=headphoneData(:,3); %Finds headphone IEP3 volume data

%% ____________________
%% CALCULATIONS

oep4CalcVol=67.1*(log10(headphonePower))-1.3; %Calculates predicted OEP4 volumes
iep3CalcVol=77.7*(log10(headphonePower))-7.3; %Calculates predicted IEP3 volumes

%% ____________________
%% FORMATTED FIGURE
figure(1)%Creates figure
hold all%Holds all plots to figure 1
title('Actual Versus Calculated Volumes at Different Power Settings')%Titles the figure
xlabel('Power in milliwatts (mW)')%Labels x axis
ylabel('Volume in decibels (dB)')%Labels y axis
grid on%Turns on grid
plot(headphonePower,oep4Volume,'xr-')%Plots OEP4 volume
plot(headphonePower,iep3Volume,'*g--')%Plots IEP3 volume
plot(headphonePower,oep4CalcVol,'ob-.')%Plots OEP4 calculated volume
plot(headphonePower,iep3CalcVol,'+m:')%Plots IEP3 calculated volume
legend('OEP4','IEP3','OEP4 Calculated','IEP3 Calculated','Location','southeast')%Adds legend to figure 1

%% ____________________
%% ANALYSIS

%% -- Q1
% The model for calculated volume in relation to power for the IEP3
% prototype is most accurate, as it most closely follows its dataset.

%% -- Q2
% IEP3 seems to have the highest sensitivity, as it gradually gains a
% higher volume level than OEP4 at the same power levels, in both the
% actual data and computational models shown in the graph. Though OEP4 is
% intially slightly more sensitive, IEP3 is more sensitive over the largest
% area of the data.

%% -- Q3
% At 30dB, OEP4 requires slightly less power according to predictions and
% actual test data, so it would have a longer battery life due to slightly
% lower power consumption. At 60dB however,IEP3 has a much lower power
% requirement, nearly 1 milliwatt less than OEP4. Therefore, IEP3 would
% have the longest battery life at 60dB.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.