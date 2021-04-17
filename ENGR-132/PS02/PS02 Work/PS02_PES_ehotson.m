%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%As a recruiter for a large corporation participating in Purdue Industrial
%Roundtable, you are surveying students and collecting data on their GPA
%and preferred engineering discipline to answer questions about each
%student.
%
% Assigment Information
%   Assignment:     PS 02, Problem 1
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

surveyData=csvread('Data_PES_survey_record.csv',1,0);%Reads the data given by the survey, removing the first line of headings


%% ____________________
%% CALCULATIONS

noInterest=surveyData==0;%finds students who didn't show interest in a major, converted into a matrix

chooseNone=sum(noInterest,2); %finds which students showed no interest in any major

nonePicked=find(noSchool==1);%Determines the rows of these students

numNone=numel(nonePicked);%Counts the students who showed no interest in all majors

noSchool=chooseNone==3; %determines whether each student showed no interest in any school or not

oneSchool=find(chooseNone==2);%Finds which students only showed interest in one school

numOne=numel(oneSchool);%Counts the students who only showed interest in one school

allSchool=chooseNone==0;%Finds the number of students who showed interest in all schools

oneInterest=find(oneSchool==1);%Finds the number of students who only showed interest in one school

eceCE=find((surveyData(:,2)~=0)&(surveyData(:,4)~=0)&(surveyData(:,3)==0));%Finds the number of students who showed interest in ECE and CE

eceCEmin=min(surveyData(eceCE,5));%Finds the minimum GPA of those who showed interest in ECE and CE

idAllInterest=surveyData(allSchool,1);%Finds the IDs of those who showed interest in all schools

ce1ME3=find((surveyData(:,4)==1)&(surveyData(:,3)==3));%Finds the students who had CE as 1st choice and ME as 3rd

numCE1ME3=numel(ce1ME3);%Finds how many students had CE as 1st choice and ME as 3rd

intECE=find(surveyData(:,2)~=0);%Finds students who showed interest in ECE

numIntECE=numel(intECE);%Counts how many students showed interest in ECE

avgIntECE=(sum(surveyData(intECE,2))/numIntECE);%Finds the average interest level shown by those who were interested in ECE

eceME35=find((surveyData(:,5)>=3.5)&((surveyData(:,2)==1)|(surveyData(:,3)==1)));%Finds the students who had a GPA higher than 3.5
%who were put either ECE or ME as their first choice.

numEceMe=numel(eceME35);%Finds the number of these students there were

avgEceMe=sum(surveyData(eceME35,5))/numEceMe; %Finds the average GPA of these students

%% ____________________
%% FORMATTED TEXT DISPLAYS

%Prints answer to Question A
fprintf('A. Row indices of students who selected no school:\n')
disp(nonePicked)

%Prints answer to Question B
fprintf('B. Number of students who selected no school: %.0f\n',numNone)

%Prints answer to Question C
fprintf('C. Number of students interested in only one school: %.0f\n',numOne)

%Prints answer to Question D
fprintf('D. Minimum GPA of students who had interest in ECE and CE, but not ME: %.2f\n',eceCEmin)

%Prints answer to Question E
fprintf('E. Survey IDs of students who showed interest in all schools:')
disp(idAllInterest)

%Prints answer to Question F
fprintf('F. Number of students who first choice was CE and third choice was ME: %.0f\n',numCE1ME3)

%Prints answer to Question G
fprintf('G. Average interest in ECE: %.4f\n',avgIntECE)

%Prints answer to Question H
fprintf('H. Average GPA of GPA>3.5 students who chose ECE or ME: %.2f\n',avgEceMe)

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The code I am submitting
% is my own original work.