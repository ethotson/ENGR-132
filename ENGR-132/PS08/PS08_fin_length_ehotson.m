function [minLength] = PS08_fin_length_ehotson(diameter,tConductivity,sourceTemp,ambientTemp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program's function is to determine the minimum length of heat
% radiating fin that can be used to approximate the heat loss of an
% infinitely long radiator fin.
%
% Function Call
% x = PS08_fin_length_ehotson(a,b,c,d)
%
% Input Arguments
% 1)diameter - the diameter of the fin rod
% 2)tConductivity - The thermal conductivity of the metal
% 3)sourceTemp - The heat source's temperature
% 4)ambientTemp - The ambient air temperature
%
% Output Arguments
% minLength - The minimum length of fin required for an accurate
% approximation at infinite length
%
% Assignment Information
%   Assignment:       	PS 08, Problem 2
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

%% ____________________
%% CALCULATIONS
%First if statement prints error if some or all input values are zero
if(diameter == 0 || tConductivity == 0 || sourceTemp == 0 || ambientTemp == 0)
  fprintf("Error: Invalid input, one or more inputs is zero.");
  if(diameter == 0 && tConductivity == 0 && sourceTemp == 0 && ambientTemp == 0)
      fprintf("Minimum Fin Length: -1");
  else
  end
else %When all inputs are nonzero, this part of the code is run
t = 373; %t, temp and x are all initialized for the loop here
temp = 373;
x = 0; 
m = sqrt((100 * diameter * pi) / (tConductivity * (pi * (diameter / 2) ^ 2)));
    while(temp>ambientTemp)
        temp = round(t);
        t = ambientTemp + (sourceTemp - ambientTemp) * exp(-m*x);
        x=x+1;
    end
fprintf("The minimum rod length required to use the infinite fin model is:")
minLength = x;
end
%% ____________________
%% COMMAND WINDOW OUTPUT
%
%The minimum rod length required to use the infinite fin model is:
%minLength =
%
%     3
%
%The minimum rod length required to use the infinite fin model is:
%minLength =
%
%     3
%
%
%
%
%
%
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

% Call your academic integrity statement here


