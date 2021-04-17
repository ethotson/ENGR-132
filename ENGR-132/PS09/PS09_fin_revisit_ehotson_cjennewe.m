function minLengths = PS09_fin_revisit_ehotson_cjennewe(minDiam,maxDiam,K)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program calculates the minimum rod length in millimeters for each
% of a set of rod diameters required to cool the heat source from the
% previous fin problem.
%
% Function Call
% minLengths = PS09_fin_revisit_ehotson_cjennewe(x,y,z)
%
% Input Arguments
%
% minDiam - The minimum diameter of the conducting rod. (mm)
% maxDiam - The maximum diameter of the conducting rod. (mm)
% K - The thermal conductivity of the cooling rod material.
%
% Output Arguments
%
% minLengths - A vector of the minimum lengths of conducting rod required
% for the set of diameters.
%
% Assignment Information
%   Assignment:			PS 09, Problem 2
%   Team ID:			009-01
%   Paired Partner:		Ethan Hotson, ehotson@purdue.edu
%   Paired Partner:		Coleman Jennewein, cjennewe@purdue.edu
%   Contributor:		N/A
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
%Initializes variables to be used in the calculations
tempAmbient = 298;
tempSource = 373;
hCoefficient = 100; %In (W/(k*m^2) the heat transfer coefficient
%Converts Diameters to meters
minDiam = minDiam / 1000;
maxDiam = maxDiam / 1000;
diameter = minDiam; %In (m) The diameter of the rod
counter = 0;

%% ____________________
%% CALCULATIONS

if (diameter >= 0 || K >= 0 || maxDiam >= 0)
	for diameter = minDiam:0.0005:maxDiam
        counter = counter + 1;
        constantM = sqrt( ( hCoefficient * ( pi * diameter )) / ( K * ( pi * ( diameter / 2 )^2 )));    
        rodLength = 0; %In (cm), the minimum length of a rod required to use the infinite fin model
        modelT = tempSource;
        while( modelT > tempAmbient )
            rodLength = rodLength + 1; %Increments rodLength
            modelT = tempAmbient + ( tempSource - tempAmbient ) * exp( -constantM * ( rodLength / 100 )); %Calculates modelled temp (in K) at end of rod
            modelT = round(modelT); %In (K), the modelled temp of the rod at a certain distance from the heat source
        end
        minLengths(counter) = rodLength;
        fprintf("\ndiameter = %f (mm), min rod length = %f",diameter*1000,minLengths(counter))
	end
else
    %Prints output and error message and sets rodlenth to -1
    fprintf("Invalid input")
    rodLength = -1;
    fprintf(" Minimum Rod Length = %f cm\n",rodLength) 
end

%% ____________________
%% COMMAND WINDOW OUTPUT



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT

PS07_academic_integrity_ehotson
        


