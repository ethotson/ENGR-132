%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This program creates and concatenates vectors in various ways to eventually
%create matrix H with the last row and the last column being the sum of the
%other elements in their respective rows and columns.
%
% Assigment Information
%   Assignment:			PS 03, Problem 1
%   Author:				Cole Jennewein, cjennewe@purdue.edu
%   Team ID:			009-01
%   Paired Partner:		Will Popovich, wpopovic@purdue.edu
%                       Otto Meccia, omeccia@purdue.edu
%   Contributor:		Ethan Hotson, ehotson@purdue.edu
%   Our contributor(s) helped us:	
%     [ ] understand the assignment expectations without
%         telling us how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping us plan our solution.
%     [ ] think through the meaning of a specific error or
%         bug present in our code without looking at our code.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% ____________________
%% INITIALIZATION

%This block creates the initial matrices used in this program
A = zeros(4); %create matrix A as a 4x4 zero matrix
vals = [1 3 2 4;5 6 7 8;9 10 11 12;13 15 14 16]; %creates matrix vals


%% ____________________
%% COPY & CONCATENATION

%This block creates the matrices that will be used to create matrix A
M = vals(2:3 , 2:3); %takes the middle 2x2 of vals
C = vals(1, 2:3); %takes specific values from vals and makes a 1x2 matrix
D = vals(4 , 2:3); %takes specific values from vals and makes a 1x2 matrix
E = [vals(1) D vals(1,4)]; %concatenates D between the first and 4th elements in the first row of vals
F = [vals(4) C vals(4,4)];%concatenates C between the first and 4th elements in the last row of vals


%% ____________________
%% REPLACE MATRIX ELEMENTS

%This block primarily manipulates matrix A
A(1,:) = E; %Replaces first row of A with E
A(4,:) = F; %Replaces last row of A with F
A(2:3 , 2:3) = M; %Replaces the center 2x2 of A with M
A(2) = vals(3,4); %Replaces the value at 2,1 of A with the value at 3,4 in vals
A(3) = vals(2,4); % Replaces the value at 3,1 of A with the value at 2,4 in vals
A(2,4) = vals(3,1); %Replaces the value at 2,4 in A with the value at 3,1 in vals
A(3,4) = vals(2); %Replaces the value at 3,4 in A with the values at 2,1 in vals

%% ____________________
%% FINAL MATRIX

%This block creates final matrix H by manipulating values from matrix A
X = A(1,:) + A(2,:) + A(3,:) + A(4,:); %Takes the sum of the values in each column of A
G = [A;X]; %Concatenates vector X to the bottom of matrix A to create matrix G
Y = G(:,1) + G(:,2) + G(:,3) + G(:,4); %Takes the sums of the values in each row of matrix G
H = [G Y]; %Concatenates vector Y to the right of matrix G to create matrix H
H(5,5) = H(1,1) + H(2,2) + H(3,3) + H(4,4); %Assigns H(5,5) to the sum of the diagonals from top left to bottom right

%% ____________________
%% FORMATTED TEXT DISPLAY 

%This block will print the final outputs of the program
fprintf('After doing step 8.e, the value in the center of H is %.0f.\n',H(3,3))
fprintf('After doing step 8.e, the value in the upper left of H is %.0f, and the value in the upper right of H is %.0f.\n',H(1,1),H(1,5))
fprintf('After doing step 8.e, the value in the lower left of H is %.0f, and the value in lower right of H is %.0f.\n',H(5,1),H(5,5))
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The script we are submitting
% is our own original work.
