%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%You are an agricultural engineer tasked with analyzing data collected by
%remote sensing equipment to minimize the effect of weeds on agriculture,
%by helping farmers identify and target areas suffering the most weed
%infestation.
%
% Assigment Information
%   Assignment:     PS 02, Problem 3
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

weedData=load('Data_weed_percent_fieldA152nF.txt');%Loads the weed percent data

%% ____________________
%% CALCULATIONS

numPixels=numel(weedData);%Counts the number of pixels are recorded in the data

weedMean=mean(weedData)%Finds the mean weed percentage of each column of the data

weedColumnMax=max(weedMean);%Finds the column with the highest weed percentage

[maxRow maxColumn]=find(weedMean==weedColumnMax);%Finds row and column of the max column weed percentage

plantDom=find(weedData<=0.15);%Finds the plant dominant pixels

numPlantDom=numel(plantDom);%Counts the plant dominant pixels

[plantDomRow,plantDomCol]=find(weedData(:,:)<=0.15);%Finds the coordinates of plant dominant pixels

plantDomAvg=sum(weedData([plantDomRow,plantDomCol]),'all')/numPlantDom;%Finds the average weed percent in the plant dominated pixels

criticalPix=find(0.75<=weedData<=0.95);%Finds the pixels at critical weed levels

numCritPix=numel(criticalPix);%Counts the pixels at critical weed levels

[critRows,critColumns]=find(weedData>0.95);%Finds the coordinates of pixels that must be visually inspected

%% ____________________
%% FORMATTED TEXT DISPLAYS

%Answer to Question A
fprintf('Question A: \n')
fprintf('Number of field pixels in the data set: %.0f\n',numPixels)

%Answer to Question B
fprintf('Question B: \n')
fprintf('Column with the highest average weed percent: %.0f\n',maxColumn)
fprintf('Average weed percentage of this column: %.4f\n',weedColumnMax)

%Answer to Question C
fprintf('Question C: \n')
fprintf('Number of pixels that have dominant plants: %.0f\n',numPlantDom)
fprintf('Average weed percentage of these pixels: %.4f\n',plantDomAvg)

%Answer to Question D
fprintf('Question D: \n')
fprintf('Number of field pixels that require urgent weed treatment: %.0f\n',numCritPix)

%Answer to Question E
fprintf('Question E: \n')
fprintf('Coordinates ([row(s), columns(s)]} of pixel(s) requiring immediate visual inspection:\n')
disp([critRows critColumns])


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The code I am submitting
% is my own original work.