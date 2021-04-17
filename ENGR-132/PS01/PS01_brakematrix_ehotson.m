%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% You must analyse data for a mechanical brake design to interperet the
% results of multiple stopping time tests.
%
% Assigment Information
%   Assignment:     PS 01, Problem 3
%   Author:         Ethan Hotson, ehotson@purdue.edu
%   Team ID:        N/A
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

brakeData=[0.59,0.62,0.6,0.6;0.97,0.91,0.98,0.95;1.25,1.15,1.1,1.12] %Matrix containing the brake time for each condition (s)

%% ____________________
%% MATRIX MANIPULATIONS

% Comment each of these matrix manipulation commands with a concise 
% explanation of what the command performs. If the command produces an
% error, explain the error and then comment the whole line

A = brakeData(2,3)%Sets variable "A" to be equal to the value of brakeData row 2, column 3.
B = brakeData(5,4)%Sets variable "B" to be equal to the value of brakeData row 5, column 4, which produces an error because there is no 5th row.

C = brakeData(1,:)%Sets variable "C" to be a row vector containing all of row 1.
D = brakeData(2,:)%Sets variable "D" to be a row vector containing all of row 2.
E = brakeData(:,3)%Sets variable "E" to be a column vector containing all of column 3.

F = brakeData(1:2)%Sets variable "F" to be a row vector containing the the first value of row 1 and 2.
G = brakeData(2:3)%Sets variable "G" to be a row vector containing the first value of row 2 and 3.
H = brakeData(1:2,2:3)%Sets variable "H" to be a matrix containing all values from rows 1 and 2 that are also in columns 2 and 3.

J = [D C]%Sets variable "J" to be a row vector containing the row vectors assigned to variables "D" and "C".
K = [D;C]%Sets variable "K" to be a matrix with row vector "D" above row vector "C".
L = [D E]%Error occurs because row vector D and column vector E have different dimensions and cannot form a matrix.

M = sort(D)%Sorts the row vector assigned to "D" from smallest value to largest value.

brakeData(2,3) = 0.96 %Sets the value of brakeData column 2, row 3 to be equal to 0.96.

%% ____________________
%% CALCULATIONS

stopTimes=brakeData(:,2) %Creates a column vector containing the values of column 2.

c3t4=brakeData(3,4) %Sets variable "c3t4" to the value of row 3, column 4 of brake data.

brakeData(1,4)=0.61 %Changes the value of brakeData row 1, column 4 to 0.61.

test5=[0.58;0.93;1.2] %Creates a column vector containin the test 5 data.

allbrakeData=[brakeData test5] %Creates a new matrix containing the original 4 tests as well as the 5th test. 

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The project I am submitting
% is my own original work.
