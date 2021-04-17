function [approxln3,absDiff] = PS08_ln3_noloop_ehotson(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program approximates ln3 by running a sumation to a given number of
% terms. It then returns the approximation and the difference between it
% and actual ln3.
%
% Function Call
% [approxln3,absDiff] = PS08_ln3_approx_wpopovic_ehotson(n)
%
% Input Arguments
% 1. n - the number of times the function must run in the approximation
%
% Output Arguments
% 1. approxln3 - approximation of ln3 as calculated by the series
% 2. absdiff - the absolute value of the difference between the
% approximation for ln3 and the value given by the log(3) function.
%
% Assignment Information
%   Assignment:       	PS 08, Problem 4
%   Author:             Ethan Hotson, ehotson@purdue.edu
%   Team ID:            009-01      
%  	Contributor: 		Will Popovich, wpopovic@purdue.edu
%   My contributor(s) helped me:	
%     [ ] understand the assignment expectations without
%         telling me how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping me plan my solution.
%     [X] think through the meaning of a specific error or
%         bug present in my code without looking at my code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

%preset outputs to output for invalid input
approxln3 = -99; 
absDiff = -99;

%% ____________________
%% CALCULATIONS

if ~(isscalar(n) && (floor(n) == n) && n > 0) %validate inputs
    fprintf("Error: Invalid n\nn must be a positive, scalar, integer value.\n");
else
    approxln3 = 0; %initialize the approximation
    index = 0; %initialize index for while loop
    
    %compute approximation
    for index = 0:n
        newTerm = (1/(4^index)) * (1/(2*index + 1)); %compute nth term
        approxln3 = approxln3 + newTerm; %update the approximation
    end
    
    absDiff = abs(log(3) - approxln3); %calculate the absolute difference between the approximation and matlab's value
end

%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

% Call your academic integrity statement here
