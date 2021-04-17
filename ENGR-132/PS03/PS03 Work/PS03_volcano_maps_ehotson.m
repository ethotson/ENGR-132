%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% You need to map volcano locations on a world map using vectors containing
% latitude and longitude.
%
% Assigment Information
%   Assignment:     PS 03, Problem 3
%   Author:         Ethan Hotson, login@purdue.edu
%   Team ID:        009-01
%  	Contributor:    None
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

volcData=csvread('Data_volcano_list.csv',1,3); %Reads the data from the volcano csv file
volcLat=volcData(:,1); %Creates a vector containing all data from the latitude column of data
volcLong=volcData(:,2); %Creates a vector containing all data from the longitude column of data
volcElev=volcData(:,3); %Creates a vector containing all data from the elevation column of data

%% ____________________
%% CALCULATIONS

acpCrdStep=find((volcData(:,1)>=-39.5)&(volcData(:,1)<=39.5)); %Finds volcanoes visible to ACP
acpLongCrd=volcData(acpCrdStep,2); %Finds longitude of volcanoes visible to ACP
acpLatCrd=volcData(acpCrdStep,1); %Finds latitude of volcanoes visible to ACP
acpCoord=[acpLatCrd,acpLongCrd]; %Combines coordinates of volcanoes visible to ACP

viiCrdStep=find((volcData(:,3)>2500)&(volcData(:,1)<=0)); %Finds volcanoes visible to VII
viiLongCrd=volcData(viiCrdStep,2); %Finds longitude of volcanoes visible to VII
viiLatCrd=volcData(viiCrdStep,1); %Finds latitude of volcanoes visible to VII
viiCoord=[viiLatCrd,viiLongCrd]; %Combines coordinates of volcanoes visible to VII

mascCrdStep=find((volcData(:,2)>=100&volcData(:,2)<145)|(volcData(:,2)>-140&volcData(:,2)<=-120)); %Finds volcanoes visible to MASC
mascLatCrd=volcData(mascCrdStep,1); %Finds latitude of volcanoes visible to MASC
mascLongCrd=volcData(mascCrdStep,2); %Finds longitude of volcanoes visible to MASC
mascCoord=[mascLatCrd,mascLongCrd]; %Combines coordinates of volcanoes visible to MASC

polarCrdStep=find(volcData(:,1)>=50);%Finds volcanoes visible to the PoLAR Viewer
polarLatCrd=volcData(polarCrdStep,1); %Finds latitude of volcanoes visible to PoLAR viewer
polarLongCrd=volcData(polarCrdStep,2);%Finds longitude of volcanoes visible to PoLAR viewer
polarCoord=[polarLatCrd,polarLongCrd]; %Combines coordinates of volcanoes visible to PoLAR viewer

allCoordStep=find(((volcData(:,1)>=-39.5)&(volcData(:,1)<=39.5))|((volcData(:,3)>2500)&(volcData(:,1)<=0))|((volcData(:,2)>=100&volcData(:,2)<145)|(volcData(:,2)>-140&volcData(:,2)<=-120))|(volcData(:,1)>=50));
%Finds points visible to any volcano viewer
allCrdLat=volcData(allCoordStep,1); %Finds latitudes of these volcanoes
allCrdLong=volcData(allCoordStep,2); %Finds longitudes of these volcanoes
allCoord=[allCrdLat,allCrdLong]; %Combines coordinates for these volcanoes

noCoordStep=(((volcData(:,1)>=-39.5)&(volcData(:,1)<=39.5))|((volcData(:,3)>2500)&(volcData(:,1)<=0))|((volcData(:,2)>=100&volcData(:,2)<145)|(volcData(:,2)>-140&volcData(:,2)<=-120))|(volcData(:,1)>=50));
%Finds points in the data where there are volcanoes visible to any viewer
noCoordStep2=noCoordStep==0; %Finds points where no volcanoes are visible
noCoordLat=noCoordStep2.*volcData(:,1); %Finds latitudes of non-visible volcanoes
noCoordLong=noCoordStep2.*volcData(:,2); %Finds longitudes of non-visible volcanoes
noCoord=[noCoordLat,noCoordLong]; %Combines coordinates of non-visible volcanoes

%% ____________________
%% FORMATTED FIGURES 

figure(1);%Creates figure

subplot(2,2,1);%Creates top left subplot for ACP coordinates
plot(acpLatCrd,acpLongCrd,'xr');%Plots coordinates
title('ACP Coordinates');%Titles the subplot
xlabel('latitude');%Adds x axis label
ylabel('longitude');%Adds y axis label
legend('ACP','Location','southeast')%Adds legend
grid on;%turns grid on

subplot(2,2,2);%Creates top right subplot for VII coordinates
plot(viiLatCrd,viiLongCrd,'*g');%Plots coordinates
title('VII Coordinates');%Titles the subplot
xlabel('latitude');%Adds x axis label
ylabel('longitude');%Adds y axis label
legend('VII','Location','southeast')%Adds legend
grid on;%turns grid on

subplot(2,2,3);%Creates bottom left subplot for MASC coordinates
plot(mascLatCrd,mascLongCrd,'ob');%Plots coordinates
title('MASC Coordinates');%Titles the subplot
xlabel('latitude');%Adds x axis label
ylabel('longitude');%Adds y axis label
legend('MASC','Location','southeast')%Adds legend
grid on;%turns grid on

subplot(2,2,4);%Creates bottom right subplot for PoLAR coordinates
plot(polarLatCrd,polarLongCrd,'+m');%Plots coordinates
title('PoLAR Coordinates');%Titles the subplot
xlabel('latitude');%Adds x axis label
ylabel('longitude');%Adds y axis label
legend('PoLAR','Location','southeast')%Adds legend
grid on;%turns grid on

figure(2)%Creates figure 2
hold all%Holds all plots to one figure
title('Coordinates of Volcanoes visible and not visible');%Titles the subplot
xlabel('latitude');%Adds x axis label
ylabel('longitude');%Adds y axis label
plot(allCrdLat,allCrdLong,'ob');%Plots coordinates of visible volcanoes
plot(noCoordLat,noCoordLong,'+m');%Plots coordinates of non-visible volcanoes
legend('Visible Volcanoes','Not Visible Volcanoes','Location','northwest');%Adds legend
grid on;%turns grid on

%% ____________________
%% ANALYSIS 

%% -- Q1
% Because they do not fully survey all volcanoes in the dataset, I think it
% would be helpful for another sattelite to be added, which would cover the
% areas in which other viewing systems cannot see. There are a significant
% number of marked non-visible volcanoes in figure 2.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The script I am submitting
% is my own original work.

