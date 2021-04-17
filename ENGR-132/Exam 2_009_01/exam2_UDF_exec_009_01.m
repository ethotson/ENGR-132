function exam2_UDF_exec_009_01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   This executive function imports data, helps the user identify which 
%   type of function will linearize the data, creates a model of the 
%   linearized data and plots that, and outputs the final model and a 
%   plot that shows raw data and the rectilinear model.
%
% Function Call
% exam2_UDF_exec_009_01
%
% Input Arguments
% None - This function has no inputs besides the input command
%
% Output Arguments
%
% Exam 2 Author Information:
%   Team ID:                            009-01
%   All team members names:             Ethan Hotson, ehotson@purdue.edu
%                                       Will Popovich, wpopovic@purdue.edu
%                                       Otto Meccia, omeccia@purdue.edu
%                                       Coleman Jennewein, cjennewe@purdue.edu
%   Primary coder of this function:     Ethan Hotson
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%______________
% INITIALIZATION
% Import the data into independent and dependent variables. See the exam
% document for help using this function. The code is started for you. 
passcode = "Sec 009 B-098 Team Exam";
data_type = "linear";
[x, y] = Sec009_getdata(passcode,data_type);


%%_______________
% CHOICE OF MODEL
% Call a function that plots the data in a way that allows the user to 
% decide which model to use.

exam2_UDF_choose_model_009_01(x,y);

%%______________________________________
% USER DECIDES WHICH MODEL FITS THE DATA
% This section has code started for you. The part already coded asks the user
% which of the models to use based on the plot from the model-choice UDF that
% appears. You must fill in the "replace" lines of this function inside of each
% "if" and "elseif" block of code in order to call the approprate UDF for that 
% model type. DO NOT CHANGE THE OTHER LINES OF CODE IN THIS SECTION.

check = 1;
while check == 1
    
    % This line prompts the user to enter the type of function that best 
    % represents the data, and stores the choice as a string.
    model_decision = input('\nWhich function should be used based on Figure 1?\nEnter linear, exponential, logarithmic, or power: ','s');
    fprintf('\n')

    % The following code will call the function indicated by the user and
    % display the appropriate model equation
    % or prompt the user to re-enter if the input is not recognized.
    if model_decision == "linear"
        % add call for linear p-code
        [m,b] = Sec009_linear(x,y);%Runs the linear subfunction if the linear model was chosen
        % add a print command to display the linear model using descriptive
        % variable names and proper paramter values
        fprintf("The data input into this function is LINEAR\n"); %Displays the type of data that this function will be processing.
        fprintf("The m value for this function is %.4f and the b value for this function is %.4f\n",m, b);%Displays the m and b values of the model.
        fprintf("The general form of this function is: y = %.4f * X + %.4f",m,b); %Displays the model function for the logarithmic model.      
        %this updates the check
        check = 0;
    elseif model_decision == "exponential"
        % add call for exponential UDF
        [m,b] = exam2_UDF_exp_009_01(x,y);%Runs the exponential subfunction if the exponential model was chosen
        % add a print command to display the exponential model using 
        % descriptive variable names and proper paramter values
        fprintf("The data input into this function is EXPONENTIAL\n"); %Displays the type of data that this function will be processing.
        fprintf("The m value for this function is %.4f and the b value for this function is %.4f\n",m, b);%Displays the m and b values of the model.
        fprintf("The general form of this function is: y = %.4f * 10 ^ (%.4f * x)\n",b,m); %Displays the model function for the logarithmic model.         
        %this updates the check
        check = 0;
    elseif model_decision == "logarithmic"
        %add call for logarithmic UDF
        [m,b] = exam2_UDF_log_009_01(x,y);%Runs the logarithmic subfunction if the log model was chosen
        % add a print command to display the logarithmic model using descriptive
        % variable names and proper paramter values
        fprintf("The data input into this function is LOGARITHMIC\n"); %Displays the type of data that this function will be processing.
        fprintf("The m value for this function is %.4f and the b value for this function is %.4f\n",m, b);%Displays the m and b values of the model.
        fprintf("The general form of this function is: y = %.4f * log(X) + %.4f\n",m,b); %Displays the model function for the logarithmic model.

        %this updates the check
        check = 0;
    elseif model_decision == "power"
        %add call for power UDF
        [m,b] = exam2_UDF_power_009_01(x,y);%Runs the power subfunction if the power model was chosen
        % add a print command to display the power model using descriptive
        % variable names and proper paramter values
        fprintf(" The data input into this function is POWER\n"); %Displays the type of data that this function will be processing.
        fprintf(" The m value for this function is %.4f and the b value for this function is %.4f\n",m,b)%Displays the m and b values of the model.
        fprintf(" Power Model Equation: Y = %.4f * x ^ %.4f \n " , b , m); %Displays the model equation for the power model.
        %this updates the check
        check = 0;
    else
        fprintf('You need to answer the question with one of the inputs given.\n')
    end
end


%%________
% ANALYSIS

% Provide answers to the analysis questions here.
% Q1:  
% -- Linear Data
%

% -- Exponential Data
%

% -- Logarithmic Data
%

% -- Power Data
%

% Q2:  
% -- Context Data
%

% Q3:
% 



%%____________________________
% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. We have not, and will not, provide 
% access to our code in any way. We are submitting our own original work. 
%%




