%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%An engineering intern for the Indiana Department of Transportation is 
%helping to study the IDT's storage capabilities of road salt.
%
% Assigment Information
%   Assignment:     PS 01, Problem 1
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

%Cone Variables
conewidth=21.50; %Width of conic piles (m)
conepiles=1; %Number of conic piles

%Windrow Variables
windrowwidth=22.25; %Width of windrow piles(m)
windrowlength=50; %Length of windrow piles(m)
windrowpiles=2; %Number of windrow piles

%General Variables for all piles
reposeang=32; %Salt angle of repose (degrees)
saltdensity=80; %Density of salt(lb/ft^3)

%% ____________________
%% CALCULATIONS

% Conversion of density from lb/ft^3 to kg/m^3
metsaltdensity=(saltdensity/2.2)*(3.3^3);

coneheight=(conewidth*tand(reposeang))/2; %Height of conic pile(m)
conevol=(pi*(conewidth^2)*coneheight)/2; %Volume of conic pile (m^3)
coneweight=coneheight*metsaltdensity/1000; %Weight of conic pile (mt)

windrowheight=(windrowwidth*tand(reposeang))/2; %Height of windrow pile (m)
windrowvol=windrowheight*windrowwidth*windrowlength; %Volume of windrow pile (m^3)
windrowweight=windrowvol*metsaltdensity/1000; %Weight of windrow pile (mt)

conestorage=(coneweight*conepiles); %Weight of salt able to be stored in cones (mt)
windrowstorage=(windrowweight*windrowpiles); %Weight of salt able to be stored in windrows (mt)


%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS
 
%Prints conic pile height and weight.
fprintf('The height of one conical pile is %0.2f m and its weight is %.1f mt.\n',coneheight,coneweight)

% Print windrow pile height and weight.
fprintf('The height of one windrow pile is %0.2f m and its weight is %.1f mt.\n',windrowheight,windrowweight)

% Print number of conic piles and weight able to be stored in this number.
fprintf('The weight of %i conical piles is %0.0f mt.\n',conepiles,conestorage)

% Print number of windrow piles and weight able to be stored in this number.
fprintf('The weight of %i windrow piles is %0.0f mt.\n',windrowpiles,windrowstorage)


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The project I am submitting
% is my own original work.
