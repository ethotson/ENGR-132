%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%You are an engineer who is tasked with analysing ignition delay data with
%two different fuel types. You are tasked with analysing this data to
%determine the relationship between measured temperature and ignition
%delay.
%
% Assigment Information
%   Assignment:     PS 05, Problem 2
%   Author:         Ethan Hotson, ehotson@purdue.edu
%   Team ID:        009-01
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
jetData = csvread('Data_jetA_ignition_delay.csv',1,0);
jetX = jetData(:,1);
jetY = jetData(:,2);
dieselData = csvread('Data_diesel_ignition_delay.csv',1,0);
dieselX = dieselData(:,1);
dieselY = dieselData(:,2);

%% ____________________
%% SUBPLOT FIGURE(S)
%linear subplot
figure(1)
subplot(2,2,1)
plot(jetX,jetY,'.b')
grid on
title('Linear Comparison of Temperature to Ignition Delay, Jet Fuel')
xlabel('1000/Temperature(K), linear scale')
ylabel('Ignition Delay (ms), linear scale')
%semilogx subplot
subplot(2,2,2)
semilogx(jetX,jetY,'.g')
grid on
title('Logarithmic X Comparison of Temperature to Ignition Delay, Jet Fuel')
xlabel('1000/Temperature(K), log scale')
ylabel('Ignition Delay (ms), linear scale')
%semilogy subplot
subplot(2,2,3)
semilogy(jetX,jetY,'.r')
grid on
title('Logarithmic Y Comparison of Temperature to Ignition Delay, Jet Fuel')
xlabel('1000/Temperature(K), linear scale')
ylabel('Ignition Delay (ms), log scale')
%loglog subplot
subplot(2,2,4)
loglog(jetX,jetY,'.k')
grid on
title('Logarithmic Axes Comparison of Temperature to Ignition Delay, Jet Fuel')
xlabel('1000/Temperature(K), log scale')
ylabel('Ignition Delay (ms), log scale')
%Diesel figure with subplots
figure(2)
subplot(2,2,1)
plot(dieselX,dieselY,'.b')
grid on
title('Linear Comparison of Temperature to Ignition Delay, Diesel Fuel')
xlabel('1000/Temperature(K), linear scale')
ylabel('Ignition Delay (ms), linear scale')
%semilogx subplot
subplot(2,2,2)
semilogx(dieselX,dieselY,'.g')
grid on
title('Logarithmic X Comparison of Temperature to Ignition Delay, Diesel Fuel')
xlabel('1000/Temperature(K), log scale')
ylabel('Ignition Delay (ms), linear scale')
%semilogy subplot
subplot(2,2,3)
semilogy(dieselX,dieselY,'.r')
grid on
title('Logarithmic Y Comparison of Temperature to Ignition Delay, Diesel Fuel')
xlabel('1000/Temperature(K), linear scale')
ylabel('Ignition Delay (ms), log scale')
%loglog subplot
subplot(2,2,4)
loglog(dieselX,dieselY,'.k')
grid on
title('Logarithmic Axes Comparison of Temperature to Ignition Delay, Diesel Fuel')
xlabel('1000/Temperature(K), log scale')
ylabel('Ignition Delay (ms), log scale')

%% ____________________
%% LINEARIZATION
%Linearization of the datasets
linear_jet = [log10(jetX),log10(jetY)];
linear_diesel = [log10(dieselX),log10(dieselY)];
%Linear regressions on the datasets
jetReg = polyfit(linear_jet(:,1),linear_jet(:,2),1);
dieselReg = polyfit(linear_diesel(:,1),linear_diesel(:,2),1);

fprintf('The Linear Equation for the Jet Fuel data is: Log[Ignition Delay(ms)] = %.4f*Log[1000/Temperature(K)]+%.4f\n',jetReg(1),jetReg(2));
fprintf('The Linear Equation for the Diesel Fuel data is: Log[Ignition Delay(ms)] = %.4f*Log[1000/Temperature(K)]+%.4f\n',dieselReg(1),dieselReg(2));

%Figure of linearized data and lines of best fit
figure(3)
hold all
plot(linear_jet(:,1),linear_jet(:,2),'.r')
plot(linear_diesel(:,1),linear_diesel(:,2),'.k')
grid on;
title('Linearized Temperature and Ignition Delay of Jet Fuel and Diesel');
xlabel('1000/Temperature(k)');
ylabel('Ignition Delay(ms)');
jetRef = refline(jetReg(1),jetReg(2));
jetRef.Color = 'r';
dieselRef = refline(dieselReg(1),dieselReg(2));
dieselRef.Color = 'k';
legend('Jet Fuel','Diesel','Jet Fuel Line','Diesel Line')

%% ____________________
%% MODEL
%Prints the Power Equations of the two datasets
fprintf('The Jet Fuel Power Equation is: Ignition Delay (ms) = %.4f * (Log[1000/Temperature(K)]) ^ (%.4f)\n',jetReg(1),jetReg(2));
fprintf('The Diesel Power Equation is: Ignition Delay (ms) = %.4f * (Log[1000/Temperature(K)]) ^ (%.4f)\n',dieselReg(1),dieselReg(2));
%Jet Fuel Figure containing normal data and power function
figure(4)
hold all
plot(jetX,jetY,'.g')
jetCurve = 10 ^ (jetReg(2)) * (jetX .^ jetReg(1));
plot(jetX,jetCurve,'-r')
grid on
xlabel('1000/Temperature(K)')
ylabel('Ignition Delay (ms)')
title('Jet Fuel Data with Curve')
%Diesel Figure containing normal data and power function
figure(5)
hold all
plot(dieselX,dieselY, '.b')
dieselCurve = 10 ^ (dieselReg(2)) * (dieselX .^ dieselReg(1));
plot(dieselX,dieselCurve,'-k')
grid on
title('Diesel Data with Curve')
xlabel('1000/Temperature(K)')
ylabel('Ignition Delay (ms)')

%% ____________________
%% ANALYSIS

%% -- Q1
% From the plots of both datasets, it appears that in both cases, a log-log
% scale for both axes is the best representation of the data because it
% makes the data appear linear. This is somewhat true for both the semilogx
% and semilogy plots, but the most apparently good representation is still
% in the log-log plot. This suggests that the the best function to
% represent the data would be a power function.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.