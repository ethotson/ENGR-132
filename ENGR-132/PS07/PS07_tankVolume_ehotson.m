function[] = PS07_tankVolume_ehotson(orient,hieght)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This program takes the orientation of a cylindrical tank with
%hemispherical ends and calculates the volume of liquid within based on the
%fluid's hieght from the tank's bottom and the orientation (horizontal or
%vertical) of the tank.
%
% Function Call
%PS07_tankVolume_template(X,Y)
%
% Input Arguments
% 1. orient - a value representing whether the tank is horizontally or
% verticlly oriented
% 2. hieght - a value representing the hieght from the bottom of the tank
% of the liquid
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:       	PS 07, Problem 3
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

diameter = 3.35

radius = diameter/2

lengthC = 21.1

%% ____________________
%% CALCULATIONS, STRUCTURE, & TEXT DISPLAYS

if(orient == 'h')
    if(hieght < 3.35)
        volume = ((pi * hieght^2)(3 * radius-hieght) / 3) + lengthC(radius ^ 2 * acos((radius-hieght) / radius) - (radius - hieght)sqrt(2 * radius * hieght - hieght ^ 2));
        fprintf('Fluid volume: %f',volume);
    else
        fprintf('Error')
elseif(orient == 'v')
    if(y < radius)
        volume = (pi(hieght ^ 2) * (3 * radius - hieght)) / 3;
        fprintf('Fluid volume: %f',volume);
    elseif(y < (radius + lengthC))
        volume = 2pi(radius ^ 3) / 3 + (pi(hieght ^ 2) * (3 * radius - hieght))/3;
        fprintf('Fluid volume: %f',volume);
    elseif(y <= (lengthC+2*radius))
        volume = pi * (radius ^ 2) * lengthC + (pi * (hieght - lengthC) ^ 2) / 3 * (3 * radius - hieght + lengthC);
        fprintf('Fluid volume: %f',volume);
    else
        fprintf('Error');
else
    fprintf('Error');
end;

%% ____________________
%% COMMAND WINDOW OUTPUTS
PS07_tankVolume_ehotson('h',3)
PS07_tankVolume_ehotson('v',5)
PS07_tankVolume_ehotson('v',20)
PS07_tankVolume_ehotson('v',100)
PS07_tankVolume_ehotson('h',5)
PS07_tankVolume_ehotson('w',1)
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

% Call your Academic Integrity function from problem 2
PS07_academic_integrity_ehotson(purdue_astronauts)
