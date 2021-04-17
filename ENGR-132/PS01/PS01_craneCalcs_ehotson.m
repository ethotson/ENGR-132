%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%You are working for a manufactoring company and have been tasked with
%coming up with some vector calculations concerning the performance of the
%crane.
%
% Assigment Information
%   Assignment:     PS 01, Problem 2
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

liftMass=[500;600;700;800;1000]; %Each crane's lifted mass (kilograms)
liftDist=[1.2;4.2;3.0;1.5;2.5]; %Each crane's lift distance (m)
liftTime=[1.2;2.4;2.0;1.5;3.0]; %Each crane's  lift time (s)
retTime=[2.4;4.8;4.0;3.5;9.0]; %Each crane's return time (s)
opHrs=12; %The amount of time a crane operates per day (hrs)
grav=9.81; %Gravitational acceleration constant(m/s^2)
principal=linspace(1000,2000,11); %Principal investment (dollars)
iRate=linspace(0.1,0.025,10); %Interest rate of investment (percent yearly)
investTime=11:2:21; %Time since investment (years)

%% ____________________
%% CALCULATIONS
%Calculations for the lift velocity of each crane (m/s)
liftVel=[liftDist(1,:)/liftTime(1,:);liftDist(2,:)/liftTime(2,:);liftDist(3,:)/liftTime(3,:);liftDist(4,:)/liftTime(4,:);liftDist(5,:)/liftTime(5,:)];

%Calculations for the gravitational force on each mass (N)
objForce=[liftMass(1,:)*grav;liftMass(2,:)*grav;liftMass(3,:)*grav;liftMass(4,:)*grav;liftMass(5,:)*grav];

%Calculations for the power required to lift each mass (W)
liftWatts=[(liftDist(1,:)*grav)/liftTime(1,:);(liftDist(2,:)*grav)/liftTime(2,:);(liftDist(3,:)*grav)/liftTime(3,:);(liftDist(4,:)*grav)/liftTime(4,:);(liftDist(5,:)*grav)/liftTime(5,:)];

%Calculations for the total number of lifts for each crane per day
dailyLifts=[12*60*60./(liftTime(1:5,:)+retTime(1:5,:))];

%Investment values with a principal of $1000 and an interest rate of 0.025%
val1000=principal(:,1)*(iRate(:,1)+1).^investTime;

%Investment values with a principal of $1500 
%and time of investment of 5 years
val1500=1500.*(iRate+1).^5;

%Investment values with an interest rate of 0.07% and a time of investment
%of 17 years for varying principal values
val007=principal.*(iRate(:,4)+1)^investTime(:,4);

%% ____________________
%% FORMATTED TEXT & FIGURE DISPLAYS

%Prints the lift velocity of each crane.
fprintf('Lift Velocity, Cranes 1-5 in order (m/s)')
liftVel

%Prints the gravitational mass on each crane's mass.
fprintf('Gravitational force on each mass, Cranes 1-5 in order (N)')
objForce

%Prints power required to lift each mass.
fprintf('Power required to lift each mass, Cranes 1-5 in order (W)')
liftWatts

%Prints the total number of lifts possible per day.
fprintf('Number of lifts possible for each crane per day, Cranes 1-5 in order')
dailyLifts

%Prints the value of investment for a principal of $1000  at an interest
%rate of 0.025%.
fprintf('Value of $1000 investment after 11-21 years in 2 year intervals at an interest rate of 0.025%')
val1000'

%Prints the value of a $1500 investment after 5 years at varying investment
%rates.
fprintf('Value of $1500 investment after 5 years at investment rates of 0.1-0.025% at 0.0075% intervals')
val1500'

%Prints the value of varying principals after 17 years at a 0.07% interest
%rate.
fprintf('Value of investments from 1000 to 2000 after 17 years at an interest rate of 0.07%')
val007'


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The project I am submitting
% is my own original work.
