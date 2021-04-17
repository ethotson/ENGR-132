function sortedMatrix = PS09_sort_ehotson(matrix)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program sorts the contents of a matrix from lowest to highest,
% starting with the lowest in the upper right corner and continuing across
% rows and then down until every number in the matrix has been sorted.
%
% Function Call
% sortedMatrix = PS09_sort_ehotson(x)
%
% Input Arguments
% matrix - The input matrix to be sorted by the function
%
% Output Arguments
% sortedMatrix - The originally input matrix, sorted as described in the
% program description.
%
% Assignment Information
%   Assignment:       	PS 09, Problem 3
%   Author:             Ethan Hotson, ehotson@purdue.edu
%   Team ID:            009-01      
%  	Contributor: 		N/A
%   My contributor(s) helped me:	
%     [ ] understand the assignment expectations without
%         telling me how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping me plan my solution.
%     [ ] think through the meaning of a specific error or
%         bug present in my code without looking at my code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

sizeMatrix = size(matrix); %Takes the size of the input matrix
zeroMatrix = zeros(sizeMatrix); %Converts the size of the input matrix into a same-size matrix of zeros
colIndex = 1; %Creates column index and sets it to 1
rowIndex = 1; %Creates row index and sets it to 1

%% ____________________
%% CALCULATIONS

for rowIndex = 1:sizeMatrix(1)%Row index for loop, increments for each row
   for colIndex = 1:sizeMatrix(2)%Column index for loop, increments for each column
       minMatrix=min(matrix);%Finds the minimum value which has not yet been sorted
       numMin=sum((matrix == minMatrix)); %Counts how many times this value appears
       if(numMin>1)%If loop for when there are more than one minimum value in the matrix
          oneLess=ones(numMin-1);
          minVector=oneLess * minMatrix; %Creates matrix of minimum value(s) if there are multiple
          matrix=[minVector,find(matrix>minMatrix)]; %Concetanates the original matrix and the min value matrix.
       else
          matrix(rowIndex,colIndex)=minMatrix; 
       end
   end
end


%% ____________________
%% COMMAND WINDOW OUTPUT



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
 
PS07_academic_integrity_ehotson
        
        