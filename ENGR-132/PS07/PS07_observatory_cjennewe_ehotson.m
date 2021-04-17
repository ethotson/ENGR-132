function PS07_observatory_cjennewe_ehotson(xCoord,yCoord)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program takes the x and y coordinates of a camera location as xCoord
% and y Coord in meters and uses those coordinates to determine whether the
% camera is in the observatory, exhibit hall, mechanical room, offices, on
% the wall, or outside the building. It then outputs the name of the room
% the camera is in or "invalid" if the camera is on the wall or outside.
%
% Function Call
% PS07_observatory_cjennewe_ehotson.m(X,Y)
%
% Input Arguments
% 1. xCoord (m)
% 2. yCoord (m)
% Output Arguments
% none
%
% Assignment Information
%   Assignment:			PS 07, Problem 1
%   Team ID:			009-01
%   Paired Partner:		Cole Jennewein, cjennewe@purdue.edu
%   Paired Partner:		Ethan Hotson, ehotson@purdue.edu
%  
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



%% ____________________
%% CALCULATIONS



%% ____________________
%% FORMATTED TEXT DISPLAYS



%% ____________________
%% COMMAND WINDOW OUTPUTS
if( sqrt( xCoord^2 + yCoord^2 ) < 5 )
    fprintf("Observatory\n");
elseif( xCoord <= -6 || xCoord >= 6 || yCoord <= -8 || yCoord >= 10 || sqrt( xCoord^2 + yCoord^2 ) == 5 || yCoord == 2)
    fprintf("Invalid\n");
elseif( yCoord > 2 )
    fprintf("Exhibit Hall\n");
elseif( xCoord == 0 )
    fprintf("Invalid");
elseif( xCoord > 0 )
    fprintf("Offices");
else
    fprintf("Mechanical Room");
end;

%Test Cases
%PS07_observatory_cjennewe_ehotson(0,7)       Exhibit Hall


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have we provided
% access to our code to another. The function we are submitting
% is our own original work.