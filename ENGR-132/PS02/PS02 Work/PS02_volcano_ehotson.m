%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% You are a data processing engineer, who has been tasked to analyze data
% about volcanoes to determine how high-altitude imaging data can be used
% to help volcanologists determine the state of volcanoes.
%
% Assigment Information
%   Assignment:     PS 02, Problem 2
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

imageData=csvread('Data_volcano_list.csv',1,3);%Reads the data given by the sattelites, 
%removing the first line of headings and the first 3 lines of the text data

%% ____________________
%% CALCULATIONS

polarVolc=find(imageData(:,1)>=50);%Finds the volcanoes visible to the PoLAR viewer

numPolVolc=numel(polarVolc);%Counts the volcanoes visible to the PoLAR viewer

avPolarVolAlt=sum(imageData(polarVolc,3))/numel(polarVolc);%Finds the average alt of the visible volcanoes

viiVolc=find((imageData(:,3)>2500)&(imageData(:,1)<=0));%Finds the volcanoes visible to VII that had altitudes greater than 2500m

stratoVii=find(121<=viiVolc<=395);%Finds the stratovolcanoes visible to VII

numStratVII=numel(stratoVii);%Counts the stratovolcanoes visible to VII

stratoMin=min(imageData((viiVolc(stratoVii)),3));%Finds the minimum altitude of the stratovolcanoes visible to VII

stratoMax=max(imageData((viiVolc(stratoVii)),3));%Finds the max altitude of the stratovolcanoes visible to VII

stratoACP=find((-39.5<=imageData(121:395,1)<=39.5));%Finds the stratovolcanoes visible to ACP

nonStratACP=find((-39.5<=imageData(:,1)<=39.5));%Finds the non-stratovolcanoes visible to ACP

numStratoACP=numel(stratoACP)%Counts the number of stratovolcanoes visible to ACP

numNonStratACP=numel(nonStratACP)%Counts the non-stratovolcanoes visible to ACP

mascStrat=find((100<=(imageData(121:395,1))<145)|(-140<(imageData(121:395,1)<=-120)));%Finds the stratovolcanoes detectable by MASC

numMASC=numel(mascStrat);%Counts how many stratovolcanoes are detected by MASC

mascAvg=sum(imageData(find((100<=(imageData(121:395,1))<145)|(-140<(imageData(121:395,1)<=-120))),3))/numMASC%Finds the average altitude of
%the stratovolcanoes detected by MASC

%% ____________________
%% FORMATTED TEXT DISPLAYS
%Prints answer to Question A
fprintf('Question A:\n')
fprintf('Number of volcanoes visible to PoLAR viewer: %.0f\n',numPolVolc)
fprintf('Average elevation: %.0f\n',avPolarVolAlt)

%Prints answer to Question B
fprintf('Question B:\n')
fprintf('Number of stratovolcanoes visible in VII imager: %.0f\n',numStratVII)
fprintf('Minimum elevation: %.0f\n',stratoMin)
fprintf('Maximum elevation: %.0f\n',stratoMax)

%Prints answer to Question C
fprintf('Question C: \n')
fprintf('Number of stratovolcanoes visible to ACP-1: %.0f\n',numStratoACP)
fprintf('Number of non-stratovolcanoes visible to ACP-1: %.0f\n',numNonStratACP)

%Prints answer to Question D
fprintf('Question D: \n')
fprintf('Number of stratovolcanoes visible to MASC: %.0f\n', numMASC)
fprintf('Average elevation: %.0f\n',mascAvg)

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The code I am submitting
% is my own original work.